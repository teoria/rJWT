



library(R6)

JWT <- R6Class("JWT",

                  public = list(

                          timestamp = null,
                          supported_algs = array(
                                  'HS256' => array('hash_hmac', 'SHA256'),
                                  'HS512' => array('hash_hmac', 'SHA512'),
                                  'HS384' => array('hash_hmac', 'SHA384'),
                                  'RS256' => array('openssl', 'SHA256'),
                                  'RS384' => array('openssl', 'SHA384'),
                                  'RS512' => array('openssl', 'SHA512'),
                          );

                          name = NULL,
                          hair = NULL,
                          initialize = function(name = NA, hair = NA) {
                                  self$name <- name
                                  self$hair <- hair
                                  self$greet()
                          },
                          set_hair = function(val) {
                                  self$hair <- val
                          },
                          greet = function() {
                                  cat(paste0("Hello, my name is ", self$name, ".\n"))
                          },

                          decode = function(jwt, key,  allowed_algs = array())
                          {

                          },

                          encode = function (payload, key, alg = 'HS256', keyId = null, head = null)
                          {

                          },

                          sign = function (msg, key, alg = 'HS256')
                          {

                          },

                          verify = function (msg, signature, key, alg)
                          {
                          },

                          jsonDecode = function (input)
                          {

                          },

                          jsonEncode = function (input)
                          {
                                  $json = json_encode($input);
                                  if (function_exists('json_last_error') && $errno = json_last_error()) {
                                          static::handleJsonError($errno);
                                  } elseif ($json === 'null' && $input !== null) {
                                          throw new DomainException('Null result with non-null input');
                                  }
                                  return $json;
                          },

                          urlsafeB64Decode = function (input)
                          {
                                  require(base64enc)
                                  require(stringr);
                                  remainder = str_length(input) %% 4;
                                  if (remainder > 0) {
                                          padlen = 4 - remainder;
                                          inputTemp = paste(rep("=",padlen), collapse  = "")
                                          input = paste(input,inputTemp,sep = "")

                                  }

                                  replace1 <- str_replace( input, '-_' ,'\\+/')
                                  return (rawToChar(base64decode(replace1)));
                          },

                          urlsafeB64Encode = function (input)
                          {
                                #  return str_replace('=', '', strtr( base64_encode($input), '+/', '-_'));
                                  require(stringr);
                                  require(base64enc)

                                  b64enc <- base64encode(charToRaw(input))
                                  replace1 <- str_replace( b64enc,'\\+/', '-_')
                                  replace2 <- str_replace( replace1,'=', '' )
                                  return( replace2  );
                          }



                  ),

               private = list(
                       handleJsonError = function (errno)
                       {
                               messages = list(
                                       JSON_ERROR_DEPTH = 'Maximum stack depth exceeded',
                                       JSON_ERROR_STATE_MISMATCH = 'Invalid or malformed JSON',
                                       JSON_ERROR_CTRL_CHAR = 'Unexpected control character found',
                                       JSON_ERROR_SYNTAX = 'Syntax error, malformed JSON',
                                       JSON_ERROR_UTF8 = 'Malformed UTF-8 characters'
                               );

                               msgError = paste( 'Unknown JSON error: ' , errno)
                               if(!is.null(messages[[errno]]) ){
                                       msgError = messages[errno]
                               }

                               stop(msgError )

                       },
                       safeStrlen =  function (str)
                       {
                                require(stringr);
                                return( str_length(str) );
                       }
               )
)



ann <- JWT$new("Ann", "black")

