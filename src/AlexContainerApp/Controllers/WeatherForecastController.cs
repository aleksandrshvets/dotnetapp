using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace AlexContainerApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
            yield return new WeatherForecast
            {
                Summary = $"DEMO2: {Environment.GetEnvironmentVariable("HOSTNAME") ?? "No host info"}"
            };
        }
    }
}
