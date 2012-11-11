using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common.Geography;
using DayCareLib.Domain;
using DayCareLib.Common.AutoMapper;

namespace DayCareLib.Services
{
    public sealed class SearchResultService
    {
        public static List<SearchResult> GetSearchResultsFromRepository(string query, double radiusInMiles = 5)
        {
            List<SearchResult> searchResults = new List<SearchResult>();
            List<DayCareRepository> allDayCareCenters = RepositoryService.GetAllDayCareRepositoryData();

            GeoCoder coder = new GeoCoder();
            List<GeoCoder.Location> locations = coder.GetLocationsByQueryFromGoogle(query);
            if (locations == null || locations.Count == 0)
                return searchResults;

            var location = locations[0];
            foreach (var dc in allDayCareCenters)
            {
                double distance = 0.621 * GeographyUtils.HaversineDistance(dc.Latitude, dc.Longitude, location.Latitude, location.Longitude);
                if (distance <= radiusInMiles)
                {
                    SearchResult sr = dc.ToSearchResult();
                    sr.Distance = distance;
                    //TODO: Remove dummy phone
                    sr.Phone = "615-555-5555";                    
                    searchResults.Add(sr);
                }
            }

            return searchResults.OrderBy(sr => sr.Distance).ThenBy(sr => sr.Name).ToList();
        }

        public static List<SearchResult> GetSearchResultsFromRepository(double latitude, double longitude, double radiusInMiles = 5)
        {
            List<SearchResult> searchResults = new List<SearchResult>();
            List<DayCareRepository> allDayCareCenters = RepositoryService.GetAllDayCareRepositoryData();
            foreach (var dc in allDayCareCenters)
            {
                double distance = 0.621 * GeographyUtils.HaversineDistance(dc.Latitude, dc.Longitude, latitude, longitude);
                if (distance <= radiusInMiles)
                {
                    SearchResult sr = dc.ToSearchResult();
                    sr.Distance = distance;
                    //TODO: Remove dummy phone
                    sr.Phone = "615-555-5555";
                    searchResults.Add(sr);
                }
            }

            return searchResults.OrderBy(sr => sr.Distance).ThenBy(sr => sr.Name).ToList();
        }
    }
}
