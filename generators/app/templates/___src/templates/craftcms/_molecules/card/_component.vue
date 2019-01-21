<!--
 Description of what this file is for

 @package  craft3
 @author David Hellmann [david@hellmann.io]
 card
-->
<template>
  <article :class="`${rootClass}  ${cn}--vue`">
    <div :class="`${cn}__wrapper`">
      <div :class="`${cn}__inner`">
        <a :class="[`${cn}__link`]" :href="item.url">
          <picture :style="`background-color: ${item.entryImage.dominantColor};`" class="a-image">
            <source :data-srcset="item.entryImage.srcsetWebP"
                    :srcset="item.entryImage.srcsetWebP"
                    data-sizes="100vw"
                    type="image/webp">
            <img :src="item.entryImage.src"
                 :data-srcset="item.entryImage.srcset"
                 :alt="item.title"
                 class="a-image__image  lazyload"
                 data-sizes="100vw"
                 height="auto">
            <noscript><img :src="item.entryImage.src" :alt="item.title"></noscript>
          </picture>

          <h2 class="a-headline  a-headline--h6">{{ item.title }}</h2>
          <div class="a-richText" v-html="item.entrySummary"/>

          <span class="m-card__readmore">Read more</span>
        </a>
      </div>
    </div>
  </article>
</template>

<script>
  export default {
    name: 'Card',
    components: {},
    props: {
      item: {
        type: Object,
        default: () => ({}),
      },
      modifiers: {
        type: Array,
        default: () => [],
      },
    },
    data() {
      return {
        cn: 'm-card',
      };
    },
    computed: {
      rootClass() {
        const modifiers = this.modifiers.map(mod => `${this.cn}--${mod}`)
          .join('  ');
        return [this.cn, modifiers];
      },
    },
    watch: {},
    mounted() {
    },
    created() {
    },
    methods: {},
  };
</script>
