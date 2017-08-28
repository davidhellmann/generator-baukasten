import Vue from 'vue'
import hello from '../vue/_helloworld.vue'

/* eslint-disable */

new Vue({
    el: '#js-vue',
    render: createElement => createElement(hello)
})

