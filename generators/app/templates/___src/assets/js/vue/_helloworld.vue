<template>
  <div class="o-section vue">
    <div class="o-row">
      <div class="o-col-12  o-col-s-24">
        <h2>Hello World</h2>
        <input v-model="message"
               type="text">
        <p>
          {{ message }}
        </p>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
.vue {
  p {
    @include f(fs('ms3'), fs('ms7'));
  }

  input {
    @include make-vr();
  }
}
</style>

<script>
/* eslint-disable */
export default {
  data() {
    return {
      message: 'Type something…',
    };
  },
};
/* eslint-enable */
</script>
