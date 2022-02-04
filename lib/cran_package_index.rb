# frozen_string_literal: true

require_relative "cran_package_index/version"

module CranPackageIndex
  autoload :Client, "cran_package_index/client"
  autoload :Error, "cran_package_index/error"
end
