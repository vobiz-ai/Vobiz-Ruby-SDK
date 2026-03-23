# Vobiz::ConferenceApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_auth_id_conference_delete**](ConferenceApi.md#api_v1_account_auth_id_conference_delete) | **DELETE** /api/v1/Account/{auth_id}/Conference/ | Hang Up All Conferences |
| [**api_v1_account_auth_id_conference_delete_0**](ConferenceApi.md#api_v1_account_auth_id_conference_delete_0) | **DELETE** /api/v1/Account/{auth_id}/Conference/{}/ | Hang Up a Conference |
| [**api_v1_account_auth_id_conference_get**](ConferenceApi.md#api_v1_account_auth_id_conference_get) | **GET** /api/v1/Account/{auth_id}/Conference/ | List All Conferences |
| [**api_v1_account_auth_id_conference_get_0**](ConferenceApi.md#api_v1_account_auth_id_conference_get_0) | **GET** /api/v1/Account/{auth_id}/Conference/{}/ | Retrieve a Conference |
| [**api_v1_account_auth_id_conference_member_deaf_delete**](ConferenceApi.md#api_v1_account_auth_id_conference_member_deaf_delete) | **DELETE** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Deaf/ | Undeaf a Conference Member |
| [**api_v1_account_auth_id_conference_member_deaf_post**](ConferenceApi.md#api_v1_account_auth_id_conference_member_deaf_post) | **POST** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Deaf/ | Deaf a Conference Member |
| [**api_v1_account_auth_id_conference_member_delete**](ConferenceApi.md#api_v1_account_auth_id_conference_member_delete) | **DELETE** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/ | Hang Up a Conference Member |
| [**api_v1_account_auth_id_conference_member_kick_post**](ConferenceApi.md#api_v1_account_auth_id_conference_member_kick_post) | **POST** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Kick/ | Kick a Conference Member |
| [**api_v1_account_auth_id_conference_member_mute_delete**](ConferenceApi.md#api_v1_account_auth_id_conference_member_mute_delete) | **DELETE** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Mute/ | Unmute a Conference Member |
| [**api_v1_account_auth_id_conference_member_mute_post**](ConferenceApi.md#api_v1_account_auth_id_conference_member_mute_post) | **POST** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Mute/ | Mute a Conference Member |
| [**api_v1_account_auth_id_conference_member_play_delete**](ConferenceApi.md#api_v1_account_auth_id_conference_member_play_delete) | **DELETE** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Play/ | Stop Playing Audio to a Conference Member |
| [**api_v1_account_auth_id_conference_member_play_post**](ConferenceApi.md#api_v1_account_auth_id_conference_member_play_post) | **POST** /api/v1/Account/{auth_id}/Conference/{}/Member/{}/Play/ | Play Audio to a Conference Member |
| [**api_v1_account_auth_id_conference_record_delete**](ConferenceApi.md#api_v1_account_auth_id_conference_record_delete) | **DELETE** /api/v1/Account/{auth_id}/Conference/{}/Record/ | Stop Conference Recording |
| [**api_v1_account_auth_id_conference_record_post**](ConferenceApi.md#api_v1_account_auth_id_conference_record_post) | **POST** /api/v1/Account/{auth_id}/Conference/{}/Record/ | Start Conference Recording |


## api_v1_account_auth_id_conference_delete

> api_v1_account_auth_id_conference_delete(auth_id, opts)

Hang Up All Conferences

Terminate all ongoing conferences simultaneously. Returns 204 No Content.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Hang Up All Conferences
  api_instance.api_v1_account_auth_id_conference_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Hang Up All Conferences
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_delete_0

> api_v1_account_auth_id_conference_delete_0(auth_id, opts)

Hang Up a Conference

Terminate a specific conference and disconnect all participants. Returns 204 No Content.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Hang Up a Conference
  api_instance.api_v1_account_auth_id_conference_delete_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_delete_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_delete_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_delete_0_with_http_info(auth_id, opts)

```ruby
begin
  # Hang Up a Conference
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_delete_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_delete_0_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_get

> api_v1_account_auth_id_conference_get(auth_id, opts)

List All Conferences

Retrieve a list of all ongoing conferences.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # List All Conferences
  api_instance.api_v1_account_auth_id_conference_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_get_with_http_info(auth_id, opts)

```ruby
begin
  # List All Conferences
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_get_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_get_0

> api_v1_account_auth_id_conference_get_0(auth_id, opts)

Retrieve a Conference

Get detailed information about a specific ongoing conference including all active members.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve a Conference
  api_instance.api_v1_account_auth_id_conference_get_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_get_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_get_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_get_0_with_http_info(auth_id, opts)

```ruby
begin
  # Retrieve a Conference
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_get_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_get_0_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_deaf_delete

> api_v1_account_auth_id_conference_member_deaf_delete(auth_id, opts)

Undeaf a Conference Member

Restore audio reception for previously deafened members.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Undeaf a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_deaf_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_deaf_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_deaf_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_deaf_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Undeaf a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_deaf_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_deaf_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_deaf_post

> api_v1_account_auth_id_conference_member_deaf_post(auth_id, opts)

Deaf a Conference Member

Prevent member(s) from hearing other participants.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Deaf a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_deaf_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_deaf_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_deaf_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_deaf_post_with_http_info(auth_id, opts)

```ruby
begin
  # Deaf a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_deaf_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_deaf_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_delete

> api_v1_account_auth_id_conference_member_delete(auth_id, opts)

Hang Up a Conference Member

Disconnect a member by terminating their call. Returns 204 No Content.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Hang Up a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Hang Up a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_kick_post

> api_v1_account_auth_id_conference_member_kick_post(auth_id, opts)

Kick a Conference Member

Disconnect a member while allowing XML flow continuation.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Kick a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_kick_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_kick_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_kick_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_kick_post_with_http_info(auth_id, opts)

```ruby
begin
  # Kick a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_kick_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_kick_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_mute_delete

> api_v1_account_auth_id_conference_member_mute_delete(auth_id, opts)

Unmute a Conference Member

Restore audio from previously muted members.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Unmute a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_mute_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_mute_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_mute_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_mute_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Unmute a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_mute_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_mute_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_mute_post

> api_v1_account_auth_id_conference_member_mute_post(auth_id, opts)

Mute a Conference Member

Mute member(s) so others cannot hear them.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Mute a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_mute_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_mute_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_mute_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_mute_post_with_http_info(auth_id, opts)

```ruby
begin
  # Mute a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_mute_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_mute_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_play_delete

> api_v1_account_auth_id_conference_member_play_delete(auth_id, opts)

Stop Playing Audio to a Conference Member

Stop audio playback for specific member(s).

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Stop Playing Audio to a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_play_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_play_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_play_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_play_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Stop Playing Audio to a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_play_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_play_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_member_play_post

> api_v1_account_auth_id_conference_member_play_post(auth_id, opts)

Play Audio to a Conference Member

Play audio to specific member(s). Only targeted member(s) hear the audio.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Play Audio to a Conference Member
  api_instance.api_v1_account_auth_id_conference_member_play_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_play_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_member_play_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_member_play_post_with_http_info(auth_id, opts)

```ruby
begin
  # Play Audio to a Conference Member
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_member_play_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_member_play_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_record_delete

> api_v1_account_auth_id_conference_record_delete(auth_id, opts)

Stop Conference Recording

Stop an active conference recording. Returns 204 No Content.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Stop Conference Recording
  api_instance.api_v1_account_auth_id_conference_record_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_record_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_record_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_record_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Stop Conference Recording
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_record_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_record_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_conference_record_post

> api_v1_account_auth_id_conference_record_post(auth_id, opts)

Start Conference Recording

Begin recording a conference call.

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

api_instance = Vobiz::ConferenceApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Start Conference Recording
  api_instance.api_v1_account_auth_id_conference_record_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_record_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_conference_record_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_conference_record_post_with_http_info(auth_id, opts)

```ruby
begin
  # Start Conference Recording
  data, status_code, headers = api_instance.api_v1_account_auth_id_conference_record_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling ConferenceApi->api_v1_account_auth_id_conference_record_post_with_http_info: #{e}"
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

