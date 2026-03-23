# Vobiz::CallApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_auth_id_call_delete**](CallApi.md#api_v1_account_auth_id_call_delete) | **DELETE** /api/v1/Account/{auth_id}/Call/{}/ | Hang Up a Call |
| [**api_v1_account_auth_id_call_dtmf_post**](CallApi.md#api_v1_account_auth_id_call_dtmf_post) | **POST** /api/v1/Account/{auth_id}/Call/{}/DTMF/ | Send DTMF Digits |
| [**api_v1_account_auth_id_call_get**](CallApi.md#api_v1_account_auth_id_call_get) | **GET** /api/v1/Account/{auth_id}/Call/ | Retrieve All Queued Calls |
| [**api_v1_account_auth_id_call_get_0**](CallApi.md#api_v1_account_auth_id_call_get_0) | **GET** /api/v1/Account/{auth_id}/Call/{}/ | Retrieve a Queued Call |
| [**api_v1_account_auth_id_call_play_delete**](CallApi.md#api_v1_account_auth_id_call_play_delete) | **DELETE** /api/v1/Account/{auth_id}/Call/{}/Play/ | Stop Playing Audio on a Call |
| [**api_v1_account_auth_id_call_play_post**](CallApi.md#api_v1_account_auth_id_call_play_post) | **POST** /api/v1/Account/{auth_id}/Call/{}/Play/ | Play Audio on a Call |
| [**api_v1_account_auth_id_call_post**](CallApi.md#api_v1_account_auth_id_call_post) | **POST** /api/v1/Account/{auth_id}/Call/ | Make an Outbound Call |
| [**api_v1_account_auth_id_call_post_0**](CallApi.md#api_v1_account_auth_id_call_post_0) | **POST** /api/v1/Account/{auth_id}/Call/{}/ | Transfer a Call |
| [**api_v1_account_auth_id_call_record_delete**](CallApi.md#api_v1_account_auth_id_call_record_delete) | **DELETE** /api/v1/Account/{auth_id}/Call/{}/Record/ | Stop Recording a Call |
| [**api_v1_account_auth_id_call_record_post**](CallApi.md#api_v1_account_auth_id_call_record_post) | **POST** /api/v1/Account/{auth_id}/Call/{}/Record/ | Start Recording a Call |
| [**api_v1_account_auth_id_call_speak_delete**](CallApi.md#api_v1_account_auth_id_call_speak_delete) | **DELETE** /api/v1/Account/{auth_id}/Call/{}/Speak/ | Stop Speaking Text on a Call |
| [**api_v1_account_auth_id_call_speak_post**](CallApi.md#api_v1_account_auth_id_call_speak_post) | **POST** /api/v1/Account/{auth_id}/Call/{}/Speak/ | Speak Text on a Call (TTS) |


## api_v1_account_auth_id_call_delete

> api_v1_account_auth_id_call_delete(auth_id, opts)

Hang Up a Call

Terminate an active call. Returns 204 No Content.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Hang Up a Call
  api_instance.api_v1_account_auth_id_call_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Hang Up a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_dtmf_post

> api_v1_account_auth_id_call_dtmf_post(auth_id, opts)

Send DTMF Digits

Send DTMF digits to an active call for automated IVR navigation.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Send DTMF Digits
  api_instance.api_v1_account_auth_id_call_dtmf_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_dtmf_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_dtmf_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_dtmf_post_with_http_info(auth_id, opts)

```ruby
begin
  # Send DTMF Digits
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_dtmf_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_dtmf_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_get

> api_v1_account_auth_id_call_get(auth_id, opts)

Retrieve All Queued Calls

Get a list of all call UUIDs for calls currently queued and waiting to connect. Max 20 results.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  status: 'queued' # String | Must be 'queued'
}

begin
  # Retrieve All Queued Calls
  api_instance.api_v1_account_auth_id_call_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_get_with_http_info(auth_id, opts)

```ruby
begin
  # Retrieve All Queued Calls
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **status** | **String** | Must be &#39;queued&#39; | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_call_get_0

> api_v1_account_auth_id_call_get_0(auth_id, opts)

Retrieve a Queued Call

Get details of a specific queued call.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  status: 'queued' # String | Must be 'queued'
}

begin
  # Retrieve a Queued Call
  api_instance.api_v1_account_auth_id_call_get_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_get_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_get_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_get_0_with_http_info(auth_id, opts)

```ruby
begin
  # Retrieve a Queued Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_get_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_get_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **status** | **String** | Must be &#39;queued&#39; | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_call_play_delete

> api_v1_account_auth_id_call_play_delete(auth_id, opts)

Stop Playing Audio on a Call

Stop audio playback on an active call. Returns 204 No Content.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Stop Playing Audio on a Call
  api_instance.api_v1_account_auth_id_call_play_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_play_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_play_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_play_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Stop Playing Audio on a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_play_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_play_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_play_post

> api_v1_account_auth_id_call_play_post(auth_id, opts)

Play Audio on a Call

Play audio file(s) during an active call.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Play Audio on a Call
  api_instance.api_v1_account_auth_id_call_play_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_play_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_play_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_play_post_with_http_info(auth_id, opts)

```ruby
begin
  # Play Audio on a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_play_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_play_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_post

> api_v1_account_auth_id_call_post(auth_id, opts)

Make an Outbound Call

Initiate an outbound call to a PSTN number or SIP endpoint. Supports bulk calls (up to 1000 destinations using < separator).

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Make an Outbound Call
  api_instance.api_v1_account_auth_id_call_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_post_with_http_info(auth_id, opts)

```ruby
begin
  # Make an Outbound Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_post_0

> api_v1_account_auth_id_call_post_0(auth_id, opts)

Transfer a Call

Transfer an in-progress call to a different URL for new call flow instructions.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Transfer a Call
  api_instance.api_v1_account_auth_id_call_post_0(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_post_0: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_post_0_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_post_0_with_http_info(auth_id, opts)

```ruby
begin
  # Transfer a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_post_0_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_post_0_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_record_delete

> api_v1_account_auth_id_call_record_delete(auth_id, opts)

Stop Recording a Call

Stop active recording(s) on a call. Returns 204 No Content.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Stop Recording a Call
  api_instance.api_v1_account_auth_id_call_record_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_record_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_record_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_record_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Stop Recording a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_record_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_record_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_record_post

> api_v1_account_auth_id_call_record_post(auth_id, opts)

Start Recording a Call

Begin recording an active call.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Start Recording a Call
  api_instance.api_v1_account_auth_id_call_record_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_record_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_record_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_record_post_with_http_info(auth_id, opts)

```ruby
begin
  # Start Recording a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_record_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_record_post_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_speak_delete

> api_v1_account_auth_id_call_speak_delete(auth_id, opts)

Stop Speaking Text on a Call

Stop text-to-speech playback. Returns 204 No Content.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Stop Speaking Text on a Call
  api_instance.api_v1_account_auth_id_call_speak_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_speak_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_speak_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_speak_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Stop Speaking Text on a Call
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_speak_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_speak_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_call_speak_post

> api_v1_account_auth_id_call_speak_post(auth_id, opts)

Speak Text on a Call (TTS)

Convert text to speech and play it during an active call. Supports 29 languages.

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

api_instance = Vobiz::CallApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Speak Text on a Call (TTS)
  api_instance.api_v1_account_auth_id_call_speak_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_speak_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_call_speak_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_call_speak_post_with_http_info(auth_id, opts)

```ruby
begin
  # Speak Text on a Call (TTS)
  data, status_code, headers = api_instance.api_v1_account_auth_id_call_speak_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling CallApi->api_v1_account_auth_id_call_speak_post_with_http_info: #{e}"
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

