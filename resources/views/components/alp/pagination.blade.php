<template x-if="links.length">
    <nav>
        <ul class="pagination">
            <template x-for="link in links">
                <li class="page-item" x-bind:class="{disabled: !link.url, active: link.active}">
                    <template x-if="link.url">
                        <a class="page-link" x-on:click.prevent="setPage(link.url)" x-bind:href="link.url"
                           x-text="link.label"></a>
                    </template>
                    <template x-if="!link.url">
                        <span class="page-link" x-text="link.label"></span>
                    </template>
                </li>
            </template>
        </ul>
    </nav>
</template>
