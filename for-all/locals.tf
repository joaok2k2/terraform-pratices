locals {

  files           = ["ips.json", "report.csv", "sitemap.xml"]
  file_extensions = [for file in local.files : regex("\\.[0-9a-z]+$", file)]
  file_filter     = { for f in local.file_extensions : f => upper(f) if f != ".json" }

  ips = [{
    public : "123.12.221.23",
    private : "10.12.221.23"
    },
    {
      public : "140.80.20.20",
      private : "10.50.20.8"
  }]
}