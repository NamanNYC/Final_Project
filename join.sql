SELECT count(fire_number), calendar_year, det_agent.description
FROM det_agent
inner join fires_2006to2018 as fires on fires.det_agent = det_agent.det_agent
group by(calendar_year, det_agent.description)
order by calendar_year