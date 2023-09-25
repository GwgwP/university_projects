
checkpoint
dbcc dropcleanbuffers

set statistics io, time on

select distinct partkey, pname
from parts
WHERE brand='Origin' OR manufacturer='Domkapa'

set statistics io,time off