<?php

if (!function_exists('getenv_docker')) {
	function getenv_docker($env, $default) {
		return $_ENV[$env] ?? $default;
	}
}

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', getenv_docker('WORDPRESS_DB_CHARSET', 'utf8') );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', getenv_docker('WORDPRESS_DB_COLLATE', '') );

define( 'AUTH_KEY',         getenv_docker('WORDPRESS_AUTH_KEY',         '787ca10a00297d2b4de74f01aa914e1d18f154aa') );
define( 'SECURE_AUTH_KEY',  getenv_docker('WORDPRESS_SECURE_AUTH_KEY',  '2215c3d4e228e95ea064e55e9f7fa6822ad5de68') );
define( 'LOGGED_IN_KEY',    getenv_docker('WORDPRESS_LOGGED_IN_KEY',    'da35540f9c6f8a1cc578be869bec7ce14bce96a1') );
define( 'NONCE_KEY',        getenv_docker('WORDPRESS_NONCE_KEY',        'f597a88ab12ac039a350e86d5efb70ceab2944a4') );
define( 'AUTH_SALT',        getenv_docker('WORDPRESS_AUTH_SALT',        '6399f7fb743b05b970bfc05994d70e456b8eff9a') );
define( 'SECURE_AUTH_SALT', getenv_docker('WORDPRESS_SECURE_AUTH_SALT', 'b2f6e9e0ddb78db9ab1ed3ed0089e0e48841005d') );
define( 'LOGGED_IN_SALT',   getenv_docker('WORDPRESS_LOGGED_IN_SALT',   'b429b6db51ef4ec76f53c0a3e29e8f6f73655dda') );
define( 'NONCE_SALT',       getenv_docker('WORDPRESS_NONCE_SALT',       'b90f8fb511526c3df1da3d358735b44bd981e95e') );
// (See also https://wordpress.stackexchange.com/a/152905/199287)


$table_prefix = getenv_docker('WORDPRESS_TABLE_PREFIX', 'wp_');

// see also https://wordpress.org/support/article/administration-over-ssl/#using-a-reverse-proxy
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false) {
	$_SERVER['HTTPS'] = 'on';
}
// Set dynamic WP_HOME and WP_SITEURL based on the request from Host while applying SSL and DNS settings
if (isset($_SERVER['HTTP_HOST'])) {
    $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? 'https://' : 'http://';
    define('WP_HOME', $protocol . $_SERVER['HTTP_HOST']);
    define('WP_SITEURL', $protocol . $_SERVER['HTTP_HOST']);
}

define('FS_METHOD', 'direct');

// (we include this by default because reverse proxying is extremely common in container environments)

if ($configExtra = getenv_docker('WORDPRESS_CONFIG_EXTRA', '')) {
	eval($configExtra);
}
$db_host = getenv('WORDPRESS_DB_HOST');

if (strpos($db_host, ':') !== false) {
    $db_host = explode(':', $db_host)[0];
}

define('WP_REDIS_HOST', $db_host);
define('WP_REDIS_PORT', 6379);
define('WP_CACHE', true);
define('WP_REDIS_PREFIX', getenv('WORDPRESS_DB_NAME'));

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

// Disable wordpress functions
define('AUTOMATIC_UPDATER_DISABLED', true);
define('WP_AUTO_UPDATE_CORE', false);
define( 'DISALLOW_FILE_EDIT', true ); 

