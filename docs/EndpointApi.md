# Vobiz::EndpointApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_auth_id_endpoint_delete**](EndpointApi.md#api_v1_account_auth_id_endpoint_delete) | **DELETE** /api/v1/Account/{auth_id}/Endpoint/{}/ | Delete an Endpoint |
| [**api_v1_account_auth_id_endpoint_get**](EndpointApi.md#api_v1_account_auth_id_endpoint_get) | **GET** /api/v1/Account/{auth_id}/Endpoint/ | List All Endpoints |
| [**api_v1_account_auth_id_endpoint_get_0**](EndpointApi.md#api_v1_account_auth_id_endpoint_get_0) | **GET** /api/v1/Account/{auth_id}/Endpoint/{}/ | Retrieve an Endpoint |
| [**api_v1_account_auth_id_endpoint_post**](EndpointApi.md#api_v1_account_auth_id_endpoint_post) | **POST** /api/v1/Account/{auth_id}/Endpoint/ | Create Endpoint |
| [**api_v1_account_auth_id_endpoint_post_0**](EndpointApi.md#api_v1_account_auth_id_endpoint_post_0) | **POST** /api/v1/Account/{auth_id}/Endpoint/{}/ | Update an Endpoint |


## api_v1_account_auth_id_endpoint_delete

> api_v1_account_auth_id_endpoint_delete(auth_id, opts)

Delete an Endpoint

Delete an endpoint. Returns 204 No Content.

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

api_instance = Vobiz::EndpointApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete an Endpoint
  api_instance.api_v1_account_auth_id_endpoint_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_endpoint_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_endpoint_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Delete an Endpoint
  data, status_code, headers = api_instance.api_v1_account_auth_id_endpoint_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_endpoint_get

> api_v1_account_auth_id_endpoint_get(auth_id, opts)

List All Endpoints

Retrieve all endpoints with pagination.

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

api_instance = Vobiz::EndpointApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Results per page
  offset: 0 # Integer | Pagination offset
}

begin
  # List All Endpoints
  api_instance.api_v1_account_auth_id_endpoint_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_endpoint_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_endpoint_get_with_http_info(auth_id, opts)

```ruby
begin
  # List All Endpoints
  data, status_code, headers = api_instance.api_v1_account_auth_id_endpoint_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Results per page | [optional] |
| **offset** | **Integer** | Pagination offset | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_endpoint_get_0

> api_v1_account_auth_id_endpoint_get_0(auth_id, opts)

Retrieve an Endpoint

Get details of a specific endpoint.

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

api_instance = Vobiz::EndpointApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve an Endpoint
  api_instance.api_v1_account_auth_id_endpoint_get_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_get_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_endpoint_get_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_endpoint_get_0_with_http_info(auth_id, opts)

```ruby
begin
  # Retrieve an Endpoint
  data, status_code, headers = api_instance.api_v1_account_auth_id_endpoint_get_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_get_0_with_http_info: #{e}"
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


## api_v1_account_auth_id_endpoint_post

> api_v1_account_auth_id_endpoint_post(auth_id, opts)

Create Endpoint

Create a new SIP endpoint.

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

api_instance = Vobiz::EndpointApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create Endpoint
  api_instance.api_v1_account_auth_id_endpoint_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_endpoint_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_endpoint_post_with_http_info(auth_id, opts)

```ruby
begin
  # Create Endpoint
  data, status_code, headers = api_instance.api_v1_account_auth_id_endpoint_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_endpoint_post_0

> api_v1_account_auth_id_endpoint_post_0(auth_id, opts)

Update an Endpoint

Update an existing endpoint's configuration.

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

api_instance = Vobiz::EndpointApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update an Endpoint
  api_instance.api_v1_account_auth_id_endpoint_post_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_post_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_endpoint_post_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_endpoint_post_0_with_http_info(auth_id, opts)

```ruby
begin
  # Update an Endpoint
  data, status_code, headers = api_instance.api_v1_account_auth_id_endpoint_post_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling EndpointApi->api_v1_account_auth_id_endpoint_post_0_with_http_info: #{e}"
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

