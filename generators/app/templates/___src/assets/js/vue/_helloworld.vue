<template>
  <div class="o-section vue">
    <div class="o-row">
      <div class="o-col">
        <h2>Hello World</h2>
        <input type="text" v-model="message">
        <p>
          {{ message }}
        </p>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
  .vue p {
  @include f(fs('ms3'), fs('ms7'));
  }
</style>

<script>
  /* eslint-disable */
  export default {
    data() {
      return {
        message: 'hello vue'
      }
    }
  }
  /* eslint-enable */
</script>
