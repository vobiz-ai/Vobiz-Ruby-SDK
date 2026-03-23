# Vobiz::CDRApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_account_id_cdr_get**](CDRApi.md#api_v1_account_account_id_cdr_get) | **GET** /api/v1/account/{account_id}/cdr | Get Call Detail Records |


## api_v1_account_account_id_cdr_get

> api_v1_account_account_id_cdr_get(account_id, opts)

Get Call Detail Records

Retrieve call detail records with filtering and pagination.

### Examples

```ruby
require 'time'
require 'vobiz'
# setup authorization
Vobiz.configure do |config|
  # Configure API key authorization: ApiKeyAuthID
  config.api_key['X-Auth-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-ID'] = 'Bearer'

  # Configure API key authorization: ApiKeyAuthToken
  config.api_key['X-Auth-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-Token'] = 'Bearer'
end

api_instance = Vobiz::CDRApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  start_date: '2026-01-01', # String | Start date (YYYY-MM-DD)
  end_date: '2026-01-31', # String | End date (YYYY-MM-DD)
  per_page: 50, # Integer | Results per page
  page: 1 # Integer | Page number
}

begin
  # Get Call Detail Records
  api_instance.api_v1_account_account_id_cdr_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CDRApi->api_v1_account_account_id_cdr_get: #{e}"
end
```

#### Using the api_v1_account_account_id_cdr_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_cdr_get_with_http_info(account_id, opts)

```ruby
begin
  # Get Call Detail Records
  data, status_code, headers = api_instance.api_v1_account_account_id_cdr_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CDRApi->api_v1_account_account_id_cdr_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **start_date** | **String** | Start date (YYYY-MM-DD) | [optional] |
| **end_date** | **String** | End date (YYYY-MM-DD) | [optional] |
| **per_page** | **Integer** | Results per page | [optional] |
| **page** | **Integer** | Page number | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

