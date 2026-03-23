# Vobiz::ApplicationApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_auth_id_application_delete**](ApplicationApi.md#api_v1_account_auth_id_application_delete) | **DELETE** /api/v1/Account/{auth_id}/Application/{}/ | Delete an Application |
| [**api_v1_account_auth_id_application_get**](ApplicationApi.md#api_v1_account_auth_id_application_get) | **GET** /api/v1/Account/{auth_id}/Application/ | List All Applications |
| [**api_v1_account_auth_id_application_get_0**](ApplicationApi.md#api_v1_account_auth_id_application_get_0) | **GET** /api/v1/Account/{auth_id}/Application/{}/ | Retrieve an Application |
| [**api_v1_account_auth_id_application_post**](ApplicationApi.md#api_v1_account_auth_id_application_post) | **POST** /api/v1/Account/{auth_id}/Application/ | Create Application |
| [**api_v1_account_auth_id_application_post_0**](ApplicationApi.md#api_v1_account_auth_id_application_post_0) | **POST** /api/v1/Account/{auth_id}/Application/{}/ | Update an Application |
| [**api_v1_account_auth_id_numbers_application_delete**](ApplicationApi.md#api_v1_account_auth_id_numbers_application_delete) | **DELETE** /api/v1/account/{auth_id}/numbers/{}/application | Unlink Number from Application |
| [**api_v1_account_auth_id_numbers_application_post**](ApplicationApi.md#api_v1_account_auth_id_numbers_application_post) | **POST** /api/v1/account/{auth_id}/numbers/{}/application | Link Number to Application |


## api_v1_account_auth_id_application_delete

> api_v1_account_auth_id_application_delete(auth_id, opts)

Delete an Application

Delete an application. Returns 204 No Content.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete an Application
  api_instance.api_v1_account_auth_id_application_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_application_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_application_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Delete an Application
  data, status_code, headers = api_instance.api_v1_account_auth_id_application_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_application_get

> api_v1_account_auth_id_application_get(auth_id, opts)

List All Applications

Retrieve all applications with pagination.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Results per page
  offset: 0 # Integer | Pagination offset
}

begin
  # List All Applications
  api_instance.api_v1_account_auth_id_application_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_application_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_application_get_with_http_info(auth_id, opts)

```ruby
begin
  # List All Applications
  data, status_code, headers = api_instance.api_v1_account_auth_id_application_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_get_with_http_info: #{e}"
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


## api_v1_account_auth_id_application_get_0

> api_v1_account_auth_id_application_get_0(auth_id, opts)

Retrieve an Application

Get details of a specific application by its ID.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve an Application
  api_instance.api_v1_account_auth_id_application_get_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_get_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_application_get_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_application_get_0_with_http_info(auth_id, opts)

```ruby
begin
  # Retrieve an Application
  data, status_code, headers = api_instance.api_v1_account_auth_id_application_get_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_get_0_with_http_info: #{e}"
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


## api_v1_account_auth_id_application_post

> api_v1_account_auth_id_application_post(auth_id, opts)

Create Application

Create a new application with call handling URLs.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create Application
  api_instance.api_v1_account_auth_id_application_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_application_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_application_post_with_http_info(auth_id, opts)

```ruby
begin
  # Create Application
  data, status_code, headers = api_instance.api_v1_account_auth_id_application_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_application_post_0

> api_v1_account_auth_id_application_post_0(auth_id, opts)

Update an Application

Update an existing application's settings.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update an Application
  api_instance.api_v1_account_auth_id_application_post_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_post_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_application_post_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_application_post_0_with_http_info(auth_id, opts)

```ruby
begin
  # Update an Application
  data, status_code, headers = api_instance.api_v1_account_auth_id_application_post_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_application_post_0_with_http_info: #{e}"
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


## api_v1_account_auth_id_numbers_application_delete

> api_v1_account_auth_id_numbers_application_delete(auth_id, opts)

Unlink Number from Application

Remove association between a phone number and application.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Unlink Number from Application
  api_instance.api_v1_account_auth_id_numbers_application_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_numbers_application_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_numbers_application_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_numbers_application_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Unlink Number from Application
  data, status_code, headers = api_instance.api_v1_account_auth_id_numbers_application_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_numbers_application_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_numbers_application_post

> api_v1_account_auth_id_numbers_application_post(auth_id, opts)

Link Number to Application

Associate a phone number with an application.

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

api_instance = Vobiz::ApplicationApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Link Number to Application
  api_instance.api_v1_account_auth_id_numbers_application_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_numbers_application_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_numbers_application_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_numbers_application_post_with_http_info(auth_id, opts)

```ruby
begin
  # Link Number to Application
  data, status_code, headers = api_instance.api_v1_account_auth_id_numbers_application_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ApplicationApi->api_v1_account_auth_id_numbers_application_post_with_http_info: #{e}"
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

