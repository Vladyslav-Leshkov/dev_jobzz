<?php
return [


    /*
    |-------------------------------------
    | Attachments
    |-------------------------------------
    */
    'attachments' => [
        'folder' => 'attachments',
        'download_route_name' => 'attachments.download',
        'allowed_images' => (array)['png', 'jpg', 'jpeg', 'gif'],
        'allowed_files' => (array)['zip', 'rar', 'txt', 'doc', 'docx', 'pdf'],
    ],
];
