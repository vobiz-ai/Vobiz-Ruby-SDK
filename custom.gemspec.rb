# frozen_string_literal: true

# Custom gemspec configuration file
# This file is automatically loaded by the main gemspec file. The 'spec' variable is available
# in this context from the main gemspec file. You can modify this file to add custom metadata,
# dependencies, or other gemspec configurations. If you do make changes to this file, you will
# need to add it to the .fernignore file to prevent your changes from being overwritten.

def add_custom_gemspec_data(spec)
  spec.email = ["support@vobiz.ai"]
  spec.homepage = "https://github.com/vobiz-ai/Vobiz-Ruby-SDK"
  spec.metadata = spec.metadata.merge(
    "homepage_uri" => "https://vobiz.ai",
    "source_code_uri" => "https://github.com/vobiz-ai/Vobiz-Ruby-SDK",
    "documentation_uri" => "https://docs.vobiz.ai",
    "bug_tracker_uri" => "https://github.com/vobiz-ai/Vobiz-Ruby-SDK/issues"
  )
end
