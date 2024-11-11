<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { useLanguageSwitcher } from "../composables/languageSwitcher";

const { changeLanguage } = useLanguageSwitcher();
</script>

<template>
    <v-menu>
        <template v-slot:activator="{ props }">
            <v-btn color="white"
            v-bind="props"
            :ripple="false"
            variant="plain"
            >
            {{ tr('SELECTED_LANGUAGE') }}
            <v-icon color="h2h3" size="x-large">{{"keyboard_arrow_down"}}</v-icon>
            </v-btn>
        </template>
        <v-list>
            <v-list-item>
                <v-btn size="small" density="compact" variant="plain" :ripple="false" @click="changeLanguage('fi')">fi</v-btn>
            </v-list-item>
            <v-list-item>
                <v-btn size="small" density="compact" variant="plain" :ripple="false" @click="changeLanguage('en')">en</v-btn>
            </v-list-item>
            <v-list-item>
                <v-btn size="small" density="compact" variant="plain" :ripple="false" @click="changeLanguage('sv')">sv</v-btn>
            </v-list-item>
        </v-list>
    </v-menu>
</template>