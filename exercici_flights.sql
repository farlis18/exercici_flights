#1. Quantitat de registres de la taula de vols:
use usairlineflights2;
select count(flightID) as "total" from flights;

#2. Retard promig de sortida i arribada segons l’aeroport origen. 

select origin,avg(arrdelay) as 'Arrival AVG delay', avg (depDelay) as 'Departure AVG delay”'
from flights 
group  by origin
order by origin;

/*3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport
origen amb l’ordre de les files.*/

select origin, colYear as "year", colMonth as "Month", avg(arrdelay) as "Arrival AVG delay" from flights 
group by 1,2,3
order by 1,2,3;

#4. Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre).
 #Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
 
select usairports.City, colYear as "Year", colMonth as "Month", avg(arrdelay) as "Arrival AVG delay" from flights 
left join usairports on flights.origin=usairports.IATA
group by 1,2,3
order by 1,2,3;

#5. Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar 
#ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.

select UniqueCarrier as "Company", colYear as "Year", colMonth as "Month", sum(Cancelled) as total_cancelled from flights
where cancelled=1
group by 1
order by 4 desc;

#6. L’identificador dels 10 avions que més distància han recorregut fent vols.

select TailNum as "Plane Id", sum(Distance) as "Total Distance" from flights
where TailNum<>""
group by 1
order by 2 desc
limit 10;

#7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí 
#amb un retràs promig major de 10 minuts.

select uniquecarrier as "Company", avg(arrdelay) as "Arrival AVG Delay" from flights
group by 1 having avg(ArrDelay) > 10
order by 2 desc;


