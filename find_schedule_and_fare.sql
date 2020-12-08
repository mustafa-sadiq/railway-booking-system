set @origin_id = (select station_id
		from STATIONS
		where station_name = "Tomato");

set @dest_id = (select station_id
		from STATIONS
		where station_name = "Potato");

select	distinct s.schedule_id, s.transit_name, s.train_id, s.fare + s.fare*  abs(s1.stop_num - s2.stop_num)
	from	SCHEDULES s,
		(
			select t1.scheduled, t1.stop_num
			from STOPS t1
			where t1.start_station = @origin_id
		) as s1,
		(
			select t2.scheduled, t2.stop_num
			from STOPS t2
			where t2.stop_station = @dest_id
		) as s2
	where
		s.schedule_id = s1.scheduled
	and	s1.scheduled = s2.scheduled;