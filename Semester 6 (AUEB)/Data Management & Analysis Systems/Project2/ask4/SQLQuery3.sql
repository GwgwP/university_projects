checkpoint
dbcc dropcleanbuffers

set statistics io, time on

select partkey, pname
 from parts
where brand='Origin'
intersect
select partkey, pname
 from parts
where manufacturer='Domkapa'

set statistics io,time off