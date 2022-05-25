<?php

/**
 * config/routesPendingUsers.php
 *
 * @license https://opensource.org/licenses/MIT MIT License
 * @link    http://www.etsisi.upm.es/ ETS de Ingeniería de Sistemas Informáticos
 */

use Slim\App;
use TDW\ACiencia\Controller\PendingUserController;
use TDW\ACiencia\Middleware\JwtMiddleware;

/**
 * ############################################################
 * routes /api/v1/pendingUsers
 * ############################################################
 * @param App $app
 */
return function (App $app) {

    $REGEX_PENDING_USER_ID = '/{pendingUserId:[0-9]+}';
    $REGEX_PENDING_USERNAME = '/{pendingUsername:[a-zA-Z0-9()áéíóúÁÉÍÓÚñÑ %$\.+-]+}';

    // CGET: Returns all pending users
    $app->get(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS,
        PendingUserController::class . ':cget'
    )->setName('tdw_pending_users_cget');

    // GET: Returns a pending user based on a single ID
    $app->get(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS . $REGEX_PENDING_USER_ID,
        PendingUserController::class . ':get'
    )->setName('tdw_pending_users_get');

    // GET: Returns status code 204 if pendingUsername exists
    $app->get(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS . '/pendingUsername' . $REGEX_PENDING_USERNAME,
        PendingUserController::class . ':getPendingUsername'
    )->setName('tdw_pending_users_get_pending_username');

    // DELETE: Deletes a pending user
    $app->delete(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS . $REGEX_PENDING_USER_ID,
        PendingUserController::class . ':delete'
    )->setName('tdw_pending_users_delete')
        ->add(JwtMiddleware::class);

    // OPTIONS: Provides the list of HTTP supported methods
    $app->options(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS . '[' . $REGEX_PENDING_USER_ID . ']',
        PendingUserController::class . ':options'
    )->setName('tdw_pending_users_options');

    // POST: Creates a new pending user
    $app->post(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS,
        PendingUserController::class . ':post'
    )->setName('tdw_pending_users_post');

    // PUT: Updates a pending user
    $app->put(
        $_ENV['RUTA_API'] . PendingUserController::PATH_PENDINGUSERS . $REGEX_PENDING_USER_ID,
        PendingUserController::class . ':put'
    )->setName('tdw_pending_users_put');
};


