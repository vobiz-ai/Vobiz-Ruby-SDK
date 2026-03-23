# Vobiz::SubAccountApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_accounts_account_id_sub_accounts_get**](SubAccountApi.md#api_v1_accounts_account_id_sub_accounts_get) | **GET** /api/v1/accounts/{account_id}/sub-accounts/ | List All Sub-Accounts |
| [**api_v1_accounts_account_id_sub_accounts_post**](SubAccountApi.md#api_v1_accounts_account_id_sub_accounts_post) | **POST** /api/v1/accounts/{account_id}/sub-accounts/ | Create Sub-Account |
| [**api_v1_accounts_account_id_sub_accounts_sub_account_id_delete**](SubAccountApi.md#api_v1_accounts_account_id_sub_accounts_sub_account_id_delete) | **DELETE** /api/v1/accounts/{account_id}/sub-accounts/:sub_account_id | Delete a Sub-Account |
| [**api_v1_accounts_account_id_sub_accounts_sub_account_id_get**](SubAccountApi.md#api_v1_accounts_account_id_sub_accounts_sub_account_id_get) | **GET** /api/v1/accounts/{account_id}/sub-accounts/:sub_account_id | Retrieve a Sub-Account |
| [**api_v1_accounts_account_id_sub_accounts_sub_account_id_put**](SubAccountApi.md#api_v1_accounts_account_id_sub_accounts_sub_account_id_put) | **PUT** /api/v1/accounts/{account_id}/sub-accounts/:sub_account_id | Update a Sub-Account |


## api_v1_accounts_account_id_sub_accounts_get

> api_v1_accounts_account_id_sub_accounts_get(account_id, opts)

List All Sub-Accounts

Retrieve all sub-accounts.

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

api_instance = Vobiz::SubAccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  page: 1, # Integer | Page number
  size: 20, # Integer | Results per page
  active_only: true # Boolean | Filter active sub-accounts only
}

begin
  # List All Sub-Accounts
  api_instance.api_v1_accounts_account_id_sub_accounts_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_get: #{e}"
end
```

#### Using the api_v1_accounts_account_id_sub_accounts_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_accounts_account_id_sub_accounts_get_with_http_info(account_id, opts)

```ruby
begin
  # List All Sub-Accounts
  data, status_code, headers = api_instance.api_v1_accounts_account_id_sub_accounts_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **page** | **Integer** | Page number | [optional] |
| **size** | **Integer** | Results per page | [optional] |
| **active_only** | **Boolean** | Filter active sub-accounts only | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_accounts_account_id_sub_accounts_post

> api_v1_accounts_account_id_sub_accounts_post(account_id, opts)

Create Sub-Account

Create a new sub-account under the master account.

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

api_instance = Vobiz::SubAccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create Sub-Account
  api_instance.api_v1_accounts_account_id_sub_accounts_post(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_post: #{e}"
end
```

#### Using the api_v1_accounts_account_id_sub_accounts_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_accounts_account_id_sub_accounts_post_with_http_info(account_id, opts)

```ruby
begin
  # Create Sub-Account
  data, status_code, headers = api_instance.api_v1_accounts_account_id_sub_accounts_post_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_accounts_account_id_sub_accounts_sub_account_id_delete

> api_v1_accounts_account_id_sub_accounts_sub_account_id_delete(account_id, opts)

Delete a Sub-Account

Delete a sub-account. Returns 204 No Content.

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

api_instance = Vobiz::SubAccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete a Sub-Account
  api_instance.api_v1_accounts_account_id_sub_accounts_sub_account_id_delete(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_sub_account_id_delete: #{e}"
end
```

#### Using the api_v1_accounts_account_id_sub_accounts_sub_account_id_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_accounts_account_id_sub_accounts_sub_account_id_delete_with_http_info(account_id, opts)

```ruby
begin
  # Delete a Sub-Account
  data, status_code, headers = api_instance.api_v1_accounts_account_id_sub_accounts_sub_account_id_delete_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_sub_account_id_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_accounts_account_id_sub_accounts_sub_account_id_get

> api_v1_accounts_account_id_sub_accounts_sub_account_id_get(account_id, opts)

Retrieve a Sub-Account

Get details of a specific sub-account.

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

api_instance = Vobiz::SubAccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve a Sub-Account
  api_instance.api_v1_accounts_account_id_sub_accounts_sub_account_id_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_sub_account_id_get: #{e}"
end
```

#### Using the api_v1_accounts_account_id_sub_accounts_sub_account_id_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_accounts_account_id_sub_accounts_sub_account_id_get_with_http_info(account_id, opts)

```ruby
begin
  # Retrieve a Sub-Account
  data, status_code, headers = api_instance.api_v1_accounts_account_id_sub_accounts_sub_account_id_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_sub_account_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_accounts_account_id_sub_accounts_sub_account_id_put

> api_v1_accounts_account_id_sub_accounts_sub_account_id_put(account_id, opts)

Update a Sub-Account

Update sub-account settings.

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

api_instance = Vobiz::SubAccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update a Sub-Account
  api_instance.api_v1_accounts_account_id_sub_accounts_sub_account_id_put(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_sub_account_id_put: #{e}"
end
```

#### Using the api_v1_accounts_account_id_sub_accounts_sub_account_id_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_accounts_account_id_sub_accounts_sub_account_id_put_with_http_info(account_id, opts)

```ruby
begin
  # Update a Sub-Account
  data, status_code, headers = api_instance.api_v1_accounts_account_id_sub_accounts_sub_account_id_put_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling SubAccountApi->api_v1_accounts_account_id_sub_accounts_sub_account_id_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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

