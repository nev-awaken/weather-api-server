api_get <- \(req, res) {
  cat("Received request at /api endpoint\n")
  cat("Request headers:\n")
  print(req$headers)
  cat("Request method:", req$method, "\n")
  cat("Request path:", req$path, "\n")
  
  tryCatch(
    {
      api_url <- "https://randomuser.me/api/?results=5"
      api_response <- httr::GET(api_url)
      json_data <- jsonlite::fromJSON(httr::content(api_response, as = "text"))
      
      if (is.null(json_data$results)) {
        cat("Unexpected JSON structure. 'results' field not found.\n")
        res$status(500)
        res$send("Internal Server Error")
      } else {
        users <- json_data$results
        res$json(users)
      }
    },
    error = function(e) {
      cat("Error in /api route:", e$message, "\n")
      res$status(500)
      res$send("Internal Server Error")
    }
  )
}
