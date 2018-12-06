<!--
 Description of what this file is for

 @package  craft3
 @author David Hellmann [david@hellmann.io]
 cards
-->
<template>
  <div :class="rootClass">
    <div class="o-row">
      <div v-if="loading" class="o-col">Loading...</div>
      <template v-if="!loading">
        <!-- <label for="search">Suche</label> -->
        <!-- eslint-disable-next-line -->
        <!-- <input id="search" v-model="searchTerm" type="text" name="search"> -->
        <Card v-for="entry in entries"
              :item="entry"
              :key="entry.entryId"
              class="o-col-12  o-col-s-8"/>
      </template>
    </div>
    <div class="o-row">
      <template v-if="!loading">
        <template v-if="pagination.current_page > 1">
          <button @click="getEndpoint(pagination.links.previous)">prev Page</button>
        </template>

        <template v-if="pagination.current_page < pagination.total_pages">
          <button @click="getEndpoint(pagination.links.next)">next Page</button>
        </template>
      </template>
    </div>
  </div>
</template>

<script>
  import Card from '../../_molecules/card/_component.vue';

  export default {
    name: 'Cards',
    components: {Card},
    props: {
      modifiers: {
        type: Array,
        default: () => [],
      },
    },
    data() {
      return {
        cn: 'o-cards',
        api: '/api/articles.json',
        loading: false,
        entries: [],
        pagination: {},
        errors: [],
        searchTerm: '',
      };
    },
    computed: {
      filteredEntries() {
        return this.entries
          .filter(entry => entry.title.includes(this.searchTerm))
          .slice(this.currentPage, 3);
      },
      rootClass() {
        const modifiers = this.modifiers.map(mod => `${this.cn}--${mod}`).join('  ');
        return [this.cn, modifiers];
      },
    },
    watch: {},
    mounted() {
      this.getEndpoint(this.api);
    },
    created() {
    },
    methods: {
      async getEndpoint(api) {
        this.loading = true;
        try {
          const response = await fetch(api);
          const data = await response.json();
          this.entries = data.data;
          this.pagination = data.meta.pagination;
          this.loading = false;
        } catch (error) {
          this.loading = false;
          this.errors.push(error);
        }
      },
    },
  };
</script>
