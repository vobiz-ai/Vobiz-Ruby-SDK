# Vobiz::RecordingApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_account_id_recording_get**](RecordingApi.md#api_v1_account_account_id_recording_get) | **GET** /api/v1/Account/{account_id}/Recording/ | List All Recordings |
| [**api_v1_account_auth_id_export_recording_post**](RecordingApi.md#api_v1_account_auth_id_export_recording_post) | **POST** /api/v1/Account/{auth_id}/export/recording/ | Export Historical Recordings |
| [**api_v1_account_auth_id_recording_bulk_delete_delete**](RecordingApi.md#api_v1_account_auth_id_recording_bulk_delete_delete) | **DELETE** /api/v1/Account/{auth_id}/Recording/BulkDelete/ | Bulk Delete Recordings |
| [**api_v1_account_auth_id_recording_delete**](RecordingApi.md#api_v1_account_auth_id_recording_delete) | **DELETE** /api/v1/Account/{auth_id}/Recording/{}/ | Delete a Recording |
| [**api_v1_account_auth_id_recording_get**](RecordingApi.md#api_v1_account_auth_id_recording_get) | **GET** /api/v1/Account/{auth_id}/Recording/{}/ | Retrieve a Recording |


## api_v1_account_account_id_recording_get

> api_v1_account_account_id_recording_get(account_id, opts)

List All Recordings

Retrieve a paginated list of call recordings for your account.

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

api_instance = Vobiz::RecordingApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Records per request (default: 20, max: 100)
  offset: 0, # Integer | Pagination offset (default: 0)
  call_uuid: 'call_uuid_example', # String | Filter by specific call UUID
  recording_type: 'recording_type_example' # String | Filter by type: trunk or extension
}

begin
  # List All Recordings
  api_instance.api_v1_account_account_id_recording_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_account_id_recording_get: #{e}"
end
```

#### Using the api_v1_account_account_id_recording_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_recording_get_with_http_info(account_id, opts)

```ruby
begin
  # List All Recordings
  data, status_code, headers = api_instance.api_v1_account_account_id_recording_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_account_id_recording_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Records per request (default: 20, max: 100) | [optional] |
| **offset** | **Integer** | Pagination offset (default: 0) | [optional] |
| **call_uuid** | **String** | Filter by specific call UUID | [optional] |
| **recording_type** | **String** | Filter by type: trunk or extension | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_export_recording_post

> api_v1_account_auth_id_export_recording_post(auth_id, opts)

Export Historical Recordings

Export recordings as a downloadable archive sent via email (async). Returns 202 Accepted.

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

api_instance = Vobiz::RecordingApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Export Historical Recordings
  api_instance.api_v1_account_auth_id_export_recording_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_export_recording_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_export_recording_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_export_recording_post_with_http_info(auth_id, opts)

```ruby
begin
  # Export Historical Recordings
  data, status_code, headers = api_instance.api_v1_account_auth_id_export_recording_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_export_recording_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **body** | **Object** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## api_v1_account_auth_id_recording_bulk_delete_delete

> api_v1_account_auth_id_recording_bulk_delete_delete(auth_id, opts)

Bulk Delete Recordings

Delete multiple recordings matching filter criteria (async operation). Returns 202 Accepted.

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

api_instance = Vobiz::RecordingApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  add_time__gte: 'add_time__gte_example', # String | Delete recordings on/after this date (YYYY-MM-DD HH:MM:SS)
  add_time__lte: 'add_time__lte_example', # String | Delete recordings on/before this date
  call_uuid: 'call_uuid_example', # String | Delete recordings for specific call UUID
  from_number: 'from_number_example', # String | Delete by caller number (partial match)
  to_number: 'to_number_example', # String | Delete by destination number (partial match)
  recording_format: 'recording_format_example' # String | mp3 or wav
}

begin
  # Bulk Delete Recordings
  api_instance.api_v1_account_auth_id_recording_bulk_delete_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_recording_bulk_delete_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_recording_bulk_delete_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_recording_bulk_delete_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Bulk Delete Recordings
  data, status_code, headers = api_instance.api_v1_account_auth_id_recording_bulk_delete_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_recording_bulk_delete_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **add_time__gte** | **String** | Delete recordings on/after this date (YYYY-MM-DD HH:MM:SS) | [optional] |
| **add_time__lte** | **String** | Delete recordings on/before this date | [optional] |
| **call_uuid** | **String** | Delete recordings for specific call UUID | [optional] |
| **from_number** | **String** | Delete by caller number (partial match) | [optional] |
| **to_number** | **String** | Delete by destination number (partial match) | [optional] |
| **recording_format** | **String** | mp3 or wav | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_recording_delete

> api_v1_account_auth_id_recording_delete(auth_id, opts)

Delete a Recording

Permanently delete a specific recording. Returns 204 No Content.

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

api_instance = Vobiz::RecordingApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete a Recording
  api_instance.api_v1_account_auth_id_recording_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_recording_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_recording_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_recording_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Delete a Recording
  data, status_code, headers = api_instance.api_v1_account_auth_id_recording_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_recording_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_recording_get

> api_v1_account_auth_id_recording_get(auth_id, opts)

Retrieve a Recording

Get detailed information about a specific recording.

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

api_instance = Vobiz::RecordingApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve a Recording
  api_instance.api_v1_account_auth_id_recording_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_recording_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_recording_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_recording_get_with_http_info(auth_id, opts)

```ruby
begin
  # Retrieve a Recording
  data, status_code, headers = api_instance.api_v1_account_auth_id_recording_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling RecordingApi->api_v1_account_auth_id_recording_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

