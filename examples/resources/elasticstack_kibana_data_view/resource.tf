provider "elasticstack" {
  elasticsearch {}
  kibana {}
}

resource "elasticstack_kibana_data_view" "my_data_view" {
  data_view = {
    name            = "logs-*"
    title           = "logs-*"
    time_field_name = "@timestamp"
    namespaces      = ["backend"]
  }
}

resource "elasticstack_kibana_data_view" "example" {
  data_view = {
    name  = "my-data-view"
    title = "My Data View"

    field_formats = {
      "status" = {
        id = "static_lookup"
        params = {
          lookup_entries = {
            "200" = "OK"
            "404" = "Not Found"
            "500" = "Server Error"
          }
          unknown_key_value = "Unknown Status"
        }
      }

      "image_url" = {
        id = "url"
        params = {
          urltemplate  = "{{value}}"
          base_path    = "https://example.com/images/"
          content_type = "image"
          width        = "100"
          height       = "100"
        }
      }
    }
  }
}
