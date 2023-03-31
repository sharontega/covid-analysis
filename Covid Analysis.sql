---------------
#cleaning data in sql
------------------

select count(*) as num from information_schema.columns where table_name='prduts'; # getting number of columns

-------------------------------------------------------------------------------------
select count(*) as num from prduts;  # getting number of rows

-------------------------------------------------------------------------------------

delete  from prduts
where MyUnknownColumn<7; # deleting excess rows

-------------------------------------------------------------------------------------

alter table prduts
drop column MyUnknownColumn; #deleting unwanted columns

-------------------------------------------------------------------------------------

select data_type from information_schema.columns where table_schema='newschema' and table_name ='prduts'; #checking datatypes

-------------------------------------------------------------------------------------
#replacing strings

update prduts
set TotalCases=replace(TotalCases,',',''),
id=replace(id,',',''),
NewCases=replace(NewCases,',',''),
TotalDeaths=replace(TotalDeaths,',',''),
NewDeaths=replace(NewDeaths,',',''),
TotalRecovered=replace(TotalRecovered,',',''),
NewRecovered=replace(NewRecovered,',',''),
ActiveCases=replace(ActiveCases,',',''),
Critical=replace(Critical,',',''),
TotalTests=replace(TotalTests,',',''),
Population=replace(Population,',','');

-------------------------------------------------------------------------------------
#filling empty value with null
update prduts
set TotalCases = null where TotalCases='N/A';
update prduts
set id= null where id='N/A';
update prduts
set NewCases= null where NewCases='N/A';
update prduts
set TotalDeaths= null where TotalDeaths='N/A';
update prduts
set NewDeaths= null where NewDeaths='N/A';
update prduts
set TotalRecovered= null where TotalRecovered='N/A';
update prduts
 set NewRecovered= null where NewRecovered='N/A';
update prduts
set ActiveCases= null where ActiveCases='N/A';
update prduts
set Critical= null where Critical='N/A';
update prduts
set TotalTests= null where TotalTests='N/A';
update prduts
set Population= null where population='N/A';

-------------------------------------------------------------------------------------
#replacing strings
update prduts
set
NewCases=replace(NewCases,'+',''),
NewDeaths=replace(NewDeaths,'+',''),
NewRecovered=replace(NewRecovered,'+','');


-------------------------------------------------------------------------------------
#changing data types
alter table prduts
modify column TotalCases int,
modify column NewCases int,
modify column id int,
modify column TotalDeaths int,
modify column NewDeaths int,
modify column TotalRecovered int,
modify column NewRecovered int,
modify column ActiveCases int,
modify column Critical int,
modify column TotalTests int,
modify column Population int;

-------------------------------------------------------------------------------------
select * from prduts