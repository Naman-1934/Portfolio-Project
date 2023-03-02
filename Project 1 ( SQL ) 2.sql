select *
from Portfolioproject..CovidDeaths
order by 3,4


select *
from Portfolioproject..CovidVaccination
Where continent is not null
order by 3,4


-- select Data that we are going to be using 

Select location, date, total_cases, new_cases, total_deaths, population
from Portfolioproject..CovidVaccination
Where continent is not null
order by 1,2


-- Lookin at total_cases vs total_deaths

Select location, date, total_cases, total_deaths, (total_cases/total_deaths) as DeathsPercentage
from Portfolioproject..CovidVaccination
where location like '%india%'
order by 1,2


-- Looking at total_cases VS population

Select location, date, total_cases, population
from Portfolioproject..CovidVaccination
where location like '%India%'
and  continent is not null
order by 1,2


-- Looking at Countries with highest Infection Rate compred to population

select location, population, MAX(total_cases) as HighestInfectionCount
from Portfolioproject..CovidVaccination
-- where location like '%India%'
Where continent is not null
Group by location, population
order by HighestInfectionCount desc


-- showing Countries with Highest Death Count per population

select location, MAX(total_deaths) as TotalDeathCount
from Portfolioproject..CovidVaccination
Where continent is not null
group by location
order by 1,2


--LET'S BREAK THINGS 


select continent, MAX(total_deaths) as TotalDeathCount
from Portfolioproject..CovidVaccination
Where continent is not null
--group by location
Group by continent
order by 1,2


select *
from Portfolioproject..CovidDeaths dea
Join Portfolioproject..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date


-- Looking at Total Population VS Vaccinations


select vac.continent, vac.location, vac.date, vac.population
from Portfolioproject..CovidDeaths dea
Join Portfolioproject..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where vac.continent is not null
order by 1,2,3