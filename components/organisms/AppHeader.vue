<template>
  <header class="area-app-header-container">
    <nuxt-link to="/" class="area-logo"/>
    <default-header-nav v-if="showDefaultHeaderNav" :showOnlyLogo="showOnlyLogo"/>
    <edit-header-nav
      v-if="showEditHeaderNav"
      :showPostArticleLink="showPostArticleLink"
      :showEditArticleLink="showEditArticleLink"/>
    <template v-if="!showOnlyLogo">
      <header-session-links v-if="!loggedIn"/>
      <header-user-logged-in-items v-else />
    </template>
    <sign-up-modal v-show="this.showSignUpModal"/>
    <sign-up-auth-flow-modal v-show="this.showSignUpAuthFlowModal"/>
    <login-modal v-show="this.showLoginModal"/>
  </header>
</template>

<script>
import { mapGetters } from 'vuex'
import DefaultHeaderNav from '../molecules/DefaultHeaderNav'
import EditHeaderNav from '../molecules/EditHeaderNav'
import HeaderSessionLinks from '../atoms/HeaderSessionLinks'
import HeaderUserLoggedInItems from '../atoms/HeaderUserLoggedInItems'
import SignUpModal from '../organisms/SignUpModal'
import SignUpAuthFlowModal from '../organisms/SignUpAuthFlowModal'
import LoginModal from '../organisms/LoginModal'

export default {
  props: {
    showDefaultHeaderNav: {
      type: Boolean,
      default: false
    },
    showEditHeaderNav: {
      type: Boolean,
      default: false
    },
    showOnlyLogo: {
      type: Boolean,
      default: false
    },
    showPostArticleLink: {
      type: Boolean,
      default: false
    },
    showEditArticleLink: {
      type: Boolean,
      default: false
    }
  },
  components: {
    DefaultHeaderNav,
    EditHeaderNav,
    HeaderSessionLinks,
    HeaderUserLoggedInItems,
    SignUpModal,
    SignUpAuthFlowModal,
    LoginModal
  },
  computed: {
    ...mapGetters('user', [
      'loggedIn',
      'showSignUpModal',
      'showSignUpAuthFlowModal',
      'showLoginModal'
    ])
  }
}
</script>


<style lang="scss" scoped>
.area-app-header-container {
  display: grid;
  grid-area: app-header;
  grid-template-rows: 100px;
  grid-template-columns: 100px 1fr 100px;
  /* prettier-ignore */
  grid-template-areas:
    "logo nav";
  position: relative;
  z-index: 2;
}

.area-logo {
  grid-area: logo;
}

.logo-original {
  .area-logo {
    background: url('~assets/images/pc/common/header_logo_original.png') no-repeat;
    background-size: contain;
    margin: 30px;
  }
}

.logo-white {
  .area-logo {
    background: url('~assets/images/pc/common/header_logo_white.png') no-repeat;
    background-size: contain;
    margin: 30px;
  }
}

@media screen and (max-width: 920px) {
  .article-container {
    .area-app-header-container {
      background: white;
      grid-gap: 13px;
      /* prettier-ignore */
      grid-template-areas:
      '... ...  ... ...     ...'
      '... logo ... session ...'
      '... nav  ... ...     ...';
      grid-template-columns: 0 min-content 1fr 160px 3px;
      grid-template-rows: 12px 20px 18px;
    }

    .logo-original,
    .logo-white {
      .area-logo {
        background: url('~assets/images/sp/common/header_logo.png') no-repeat;
        background-size: contain;
        margin: 0;
      }
    }
  }
}

@media screen and (max-width: 550px) {
  .area-app-header-container {
    background: white;
    grid-gap: 13px;
    /* prettier-ignore */
    grid-template-areas:
      '... ...  ... ...     ...'
      '... logo ... session ...'
      '... nav  ... ...     ...';
    grid-template-columns: 0 min-content 1fr 160px 3px;
    grid-template-rows: 12px 20px 18px;
  }

  .logo-original,
  .logo-white {
    .area-logo {
      background: url('~assets/images/sp/common/header_logo.png') no-repeat;
      background-size: contain;
      margin: 0;
    }
  }
}
</style>
