<!--
 Description of what this file is for

 @package  <%= projectName %>
<% for (var i=0; i < authors.length; i++) { -%>
 @author <%= authors[i].name %> [<%= authors[i].email %>]
<% } -%>
 <%= moduleName.replace('-', '_') %>
-->
<template>
    <div :class="rootClass">
        <%= moduleName %>
    </div>
</template>

<script>
    export default {
        name: '<%= moduleName.replace('-', '_') %>',
        props: {
            modifiers: {
                type: Array,
                default: () => []
            },
        },
        data() {
            return {
                cn: '<%= pathOptions.key.charAt(0) %>-<%= moduleName.replace('-', '_') %'
            };
        },
        computed: {
            rootClass() {
                const modifiers = this.modifiers
                    .map(mod => this.cn + "--" + mod)
                    .join("  ");
                return [this.cn, modifiers];
            }
        },
        methods: {},
        watch: {},
        mounted() {},
        created() {},
        components: {},
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
    .<%= pathOptions.key.charAt(0) %>-<%= moduleName.replace('-', '_') % {
        $root: &;
        @include make-vr();
        width: 100%;
    }

    // Modul Modifiers Example
    .<%= pathOptions.key.charAt(0) %>-<%= moduleName.replace('-', '_') %--modifier {
        .<%= pathOptions.key.charAt(0) %>-<%= moduleName.replace('-', '_') %__block {
            // Styles here
        }

        @at-root {
            // Use this for nesting with root selector
        }
    }
</style>

