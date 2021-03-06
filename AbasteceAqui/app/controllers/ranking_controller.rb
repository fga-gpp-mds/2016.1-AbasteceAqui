class RankingController < ApplicationController

  def index

    find_counties()
    find_last_research_of_counties(@counties)
    fill_fuels_last_research(@researches)

  end

	def standard_deviation_index

    index()
    find_ethanol_fuels_sorted_by_standard_deviation(@fuels)
    find_gasoline_fuels_sorted_by_standard_deviation(@fuels)
    find_diesel_fuels_sorted_by_standard_deviation(@fuels)
    find_counties_sorted_by_ethanol(@ethanol_sorted)
    find_counties_sorted_by_gasoline(@gasoline_sorted)
    find_counties_sorted_by_diesel(@diesel_sorted)

	end

  def resale_price_index

    index()
    find_ethanol_fuels_sorted(@fuels)
    find_gasoline_fuels_sorted(@fuels)
    find_diesel_fuels_sorted(@fuels)
    find_counties_sorted_by_ethanol(@ethanol_sorted)
    find_counties_sorted_by_gasoline(@gasoline_sorted)
    find_counties_sorted_by_diesel(@diesel_sorted)

  end

	def find_counties

		@counties = County.fill_counties()

		return @counties

	end

	def find_last_research_of_counties(counties)

		@researches = FuelResearch.fill_object_last_research(counties)

		return @researches

	end

	def fill_fuels_last_research(researches)

    @fuels = Fuel.get_fuels_of_researchs(researches)

    return @fuels

  end

	def find_ethanol_fuels_sorted_by_standard_deviation(fuels)

    ethanol_type = 1
    @ethanol_sorted = Fuel.sort_fuel_by_standard_deviation(fuels, ethanol_type)

    return @ethanol_sorted
  end

  def find_gasoline_fuels_sorted_by_standard_deviation(fuels)

    gasoline_sorted = 2
    @gasoline_sorted = Fuel.sort_fuel_by_standard_deviation(fuels, gasoline_sorted)

  	return @gasoline_sorted

  end

  def find_diesel_fuels_sorted_by_standard_deviation(fuels)

    diesel_sorted = 5
    @diesel_sorted = Fuel.sort_fuel_by_standard_deviation(fuels, diesel_sorted)

  	return @diesel_sorted

  end

  def find_ethanol_fuels_sorted(fuels)

    ethanol_type = 1
    @ethanol_sorted = Fuel.sort_fuel_by_type(fuels, ethanol_type)

    return @ethanol_sorted
  end

  def find_gasoline_fuels_sorted(fuels)

    gasoline_type = 2
    @gasoline_sorted = Fuel.sort_fuel_by_type(fuels, gasoline_type)

    return @gasoline_sorted

  end

  def find_diesel_fuels_sorted(fuels)

    diesel_type = 5
    @diesel_sorted = Fuel.sort_fuel_by_type(fuels, diesel_type)

    return @diesel_sorted

  end

  def find_counties_sorted_by_ethanol(fuels)

    @counties_sorted_ethanol = County.find_counties_by_fuel_sorted(fuels)

    return @counties_sorted_ethanol
  end

  def find_counties_sorted_by_gasoline(fuels)

    @counties_sorted_gasoline = County.find_counties_by_fuel_sorted(fuels)

    return @counties_sorted_gasoline
  end

  def find_counties_sorted_by_diesel(fuels)

    @counties_sorted_diesel = County.find_counties_by_fuel_sorted(fuels)

    return @counties_sorted_diesel
  end

end
