# Author : Pravendra Singh
# Twitter : @hackpravj
#
# collects projects listed under datafiles and store to site.pages variable for global use

module Jekyll
  # this plugin comes under 'Generator' category of jekyll plugins
  class ProjectGenerator < Generator
    def generate(site)
      # variable that will contain all project data
      projectdata = {}

      site.data['projects'].each do |k, v|
        projectdata[v['index']] = v
      end

      # add projectdata to site.pages variable
      site.pages <<  ProjectPage.new(site, site.source, "projects", "index.html", projectdata)
      site.pages <<  ProjectPage.new(site, site.source, ".", "index.html", projectdata)
    end
  end

  class ProjectPage < Page
    def initialize(site, base, dir, name, projectdata)
      super(site, base, dir, name)

      # reverse chronologically sorted listing of all the projects
      self.data['projectdata'] = projectdata.sort.reverse
    end
  end
end
