from conans import ConanFile
from conans.tools import download, unzip
import os


class CMakeSpacifyListConan(ConanFile):
    name = "cmake-spacify-list"
    version = "master"
    generators = "cmake"
    requires = (
        "cmake-include-guard/master@smspillaz/cmake-include-guard",
        "cmake-opt-arg-parsing/master@smspillaz/cmake-opt-arg-parsing"
    )
    url = "http://github.com/polysquare/cmake-spacify-list"
    license = "MIT"

    def source(self):
        zip_name = "cmake-spacify-list-master.zip"
        download("https://github.com/polysquare/" +
                 "cmake-spacify-list/archive/master.zip", zip_name)
        unzip(zip_name)
        os.unlink(zip_name)

    def package(self):
        self.copy(pattern="*.cmake",
                  dst="cmake/cmake-spacify-list",
                  src=".",
                  keep_path=True)
