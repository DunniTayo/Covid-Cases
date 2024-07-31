SELECT * 
FROM coviddeaths 
order by 3,4;

SELECT * 
FROM covidvaccinations 
order by 3,4;

select location, date, total_cases, new_cases, total_deaths, population 
from coviddeaths 
order by 1,2;

-- Total cases vs Total Deaths
select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 
AS death_percentage_per_cases
from coviddeaths 
order by 1,2;

-- Deaths Per Cases in Different Countries
select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 
AS death_percentage_per_cases from coviddeaths 
where location like '%canada%' 
order by 1,2;

select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 
AS death_percentage_per_cases from coviddeaths 
where location like '%nigeria%' 
order by 1,2;

select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 
AS death_percentage_per_cases from coviddeaths 
where location like '%states%' 
order by 1,2;

-- Total Cases vs Population

select location, date, population, total_cases, new_cases, (total_cases/population)*100 
AS infected_population_canada from coviddeaths 
where location like '%canada%' 
order by 1,2;

select location, date, population, total_cases, new_cases, (total_cases/population)*100 
AS infected_population_nigeria from coviddeaths 
where location like '%nigeria%' 
order by 1,2;

select location, date, population, total_cases, new_cases, (total_cases/population)*100 
AS infected_population_states from coviddeaths 
where location like '%states%' 
order by 1,2;

select location, date, population, total_cases, new_cases, (total_cases/population)*100 
AS cases_vs_population_ghana from coviddeaths 
where location like '%ghana%' 
order by 1,2;

-- Countries with Highest Infection Rate compared to Population

select Location, Population, MAX(total_cases) 
as HighestInfectionCount,  Max((total_cases/population))*100 
as Percentage_of_PopulationInfected_canada From coviddeaths 
where location like '%canada%' 
Group by Location, Population 
order by Percentage_of_PopulationInfected_canada desc;

select Location, Population, MAX(total_cases) 
as HighestInfectionCount,  max((total_cases/population))*100 
as Percentage_of_PopulationInfected_nigeria from coviddeaths 
where location like '%nigeria%' group by Location, Population 
order by Percentage_of_PopulationInfected_nigeria desc;

select Location, Population, MAX(total_cases) 
as HighestInfectionCount,  max((total_cases/population))*100 
as Percentage_of_PopulationInfected_states from coviddeaths 
where location like '%states%' group by Location, Population 
order by Percentage_of_PopulationInfected_states desc;

select Location, Population, MAX(total_cases) 
as HighestInfectionCount,  max((total_cases/population))*100 
as Percentage_of_PopulationInfected_ghana from coviddeaths 
where location like '%ghana%' group by Location, Population 
order by Percentage_of_PopulationInfected_ghana desc;

-- Countries with Highest Death Count per Population

Select Location, max(total_deaths) 
as Total_Death_Count from coviddeaths 
where continent is not null group by Location 
order by Total_Death_Count desc;


-- Contintents with the highest death count per population

Select continent, MAX(Total_deaths) 
as Total_Death_Count from coviddeaths 
where continent is not null group by continent 
order by Total_Death_Count desc;

-- WORLD NUMBERS

Select SUM(new_cases) 
as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as Death_Percentage 
from coviddeaths where continent is not null Group By date 
order by 1,2;