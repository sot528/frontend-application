<template>
  <div class="session">
    <img class="search-icon" src="~assets/images/pc/common/icon_search.png" alt="search">
    <span class="session-link sign-up" @click="showSignUpModal">Sign up</span>
    /
    <span class="session-link login" @click="showLoginModal">Login</span>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  methods: {
    showSignUpModal() {
      this.setSignUpModal({ showSignUpModal: true })
      document.documentElement.scrollTop = 0
      document.querySelector('html,body').style.overflow = 'hidden'
    },
    showLoginModal() {
      this.setLoginModal({ showLoginModal: true })
      document.documentElement.scrollTop = 0
      document.querySelector('html,body').style.overflow = 'hidden'
    },
    ...mapActions('user', ['setSignUpModal', 'setLoginModal'])
  }
}
</script>


<style lang="scss" scoped>
.session {
  border-top: 6px solid #4a4a4a;
  padding-top: 38px;
  position: fixed;
  right: -49px;
  text-align: right;
  top: 340px;
  transform: rotate(90deg);
  width: 162px;

  .search-icon {
    float: left;
    padding-right: 4px;
    transform: rotate(-90deg);
    width: 16px;
  }

  .session-link {
    color: #525256;
    text-decoration: none;
    cursor: pointer;
  }
}

@media screen and (max-width: 920px) {
  .article-container {
    .session {
      border: none;
      grid-area: session;
      padding: 0;
      position: static;
      right: -46px;
      top: 340px;
      transform: rotate(0);
      width: 160px;

      .search-icon {
        float: left;
        padding: 2px 4px;
        transform: rotate(0);
      }
    }
  }
}

@media screen and (max-width: 550px) {
  .session {
    border: none;
    grid-area: session;
    padding: 0;
    position: static;
    right: -46px;
    top: 340px;
    transform: rotate(0);
    width: 160px;

    .search-icon {
      float: left;
      padding: 2px 4px;
      transform: rotate(0);
    }
  }
}
</style>
