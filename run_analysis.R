# This file is part of datasciencecoursera.

# datasciencecoursera is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# datasciencecoursera is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with datasciencecoursera.  If not, see <http://www.gnu.org/licenses/>.

GetData <- function() {
  # Gets the Samsung accelerometers data required for the project.
  # If the data directory already exists, it does nothing.
  data.dir <- "UCI HAR Dataset"
  if (!file.exists(data.dir)) {
    DownloadAndExtractData()
  }
}

DownloadAndExtractData <- function() {
  # Downloads and extracts the data file required for the project.
  # If the compressed file already exits, it is not downloaded again.
  file.name <- "getdata_projectfiles_UCI HAR Dataset.zip"
  if (!file.exists(file.name)) {
    # Replace special characters for URL encoded symbols.
    # TODO(elopio): find a libary that can escape the file name. curlEscape
    # from the RCurl package fails to escape the underscores.
    escaped.file.name <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    file.url <- paste("https://d396qusza40orc.cloudfront.net/",
                      escaped.file.name, sep="")
    download.file(file.url, destfile=file.name, method="curl")
  }
  unzip(file.name)
}

GetData()
