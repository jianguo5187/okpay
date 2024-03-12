<template>
  <div class="navbar">
    <hamburger id="hamburger-container" :is-active="sidebar.opened" class="hamburger-container" @toggleClick="toggleSideBar" />

    <breadcrumb id="breadcrumb-container" class="breadcrumb-container" v-if="!topNav"/>
    <top-nav id="topmenu-container" class="topmenu-container" v-if="topNav"/>

    <div class="right-menu">

      <template v-if="device!=='mobile'">
<!--        <search id="header-search" class="right-menu-item" />-->

        <!-- <el-tooltip content="聊天" effect="dark" placement="bottom"> -->
        <!-- <div class="avatar-wrapper">
          <i class="message" />
        </div> -->
        <!-- </el-tooltip> -->

<!--        <el-tooltip content="源码地址" effect="dark" placement="bottom">-->
<!--          <ruo-yi-git id="ruoyi-git" class="right-menu-item hover-effect" />-->
<!--        </el-tooltip>-->

<!--        <el-tooltip content="文档地址" effect="dark" placement="bottom">-->
<!--          <ruo-yi-doc id="ruoyi-doc" class="right-menu-item hover-effect" />-->
<!--        </el-tooltip>-->

<!--        <screenfull id="screenfull" class="right-menu-item hover-effect" />-->

<!--        <el-tooltip content="布局大小" effect="dark" placement="bottom">-->
<!--          <size-select id="size-select" class="right-menu-item hover-effect" />-->
<!--        </el-tooltip>-->

      </template>

      <el-dropdown class="avatar-container right-menu-item hover-effect" trigger="click">
        <div class="avatar-wrapper">
          <img :src="avatar" class="user-avatar">
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/user/profile">
            <el-dropdown-item>个人中心</el-dropdown-item>
          </router-link>
          <el-dropdown-item @click.native="setting = true">
            <span>布局设置</span>
          </el-dropdown-item>
          <el-dropdown-item divided @click.native="logout">
            <span>退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>

<!--    <el-dialog title="" :visible.sync="open" width="600px" append-to-body>-->
<!--      &lt;!&ndash; <div class="chatAppBody">-->
<!--          <div class="chatTitle">标题</div>-->
<!--          <div class="chatBox">-->
<!--              <div class="chatRow">-->
<!--                  <el-avatar class="chatAvatar" :size="30" src="https://goflychat.oss-cn-hangzhou.aliyuncs.com/static/upload/avator/2022June/32a988a3c2f8700119fa1f5da1b6a4bd.png"></el-avatar>-->
<!--                  <div class="chatMsgContent">-->
<!--                      <div class="chatUsername">唯一客服系统</div>-->
<!--                      <div class="chatContent">有什么可以帮您?</div>-->
<!--                  </div>-->
<!--              </div>-->
<!--              <div class="chatRow chatRowMe">-->
<!--                  <div class="chatContent">你好，这个客服系统多少钱？</div>-->
<!--              </div>-->
<!--          </div>-->
<!--          <div class="chatBottom">输入框区域</div>-->
<!--      </div> &ndash;&gt;-->
<!--       &lt;!&ndash;消息整体&ndash;&gt;-->
<!--      <div class="chatAppBody">-->
<!--       <div :class="message.sender==='me'?'chat-message-me':'chat-message-other'"-->
<!--             :style="{'padding-bottom':messages.length-1===index?'2rem':'none'}"-->
<!--             v-for="(message, index) in messages"-->
<!--             :key="index">-->
<!--            &lt;!&ndash;消息头像&ndash;&gt;-->
<!--            <div :class="message.sender==='me'?'message-me-asWhole-headPortrait':'message-other-asWhole-headPortrait'">-->
<!--              <img src="/static/img/profile.473f5971.jpg" class="examineeFace_logo_style">-->
<!--            </div>-->
<!--            &lt;!&ndash;消息&ndash;&gt;-->
<!--            <div :class="message.sender==='me'?'message-me-asWhole-right':'message-other-asWhole-right'">-->
<!--              &lt;!&ndash;消息上面&ndash;&gt;-->
<!--              <div :class="message.sender==='me'?'message-me-asWhole-top':'message-other-asWhole-top'">-->
<!--                考生-->
<!--              </div>-->
<!--              &lt;!&ndash;消息内容&ndash;&gt;-->
<!--              <div :class="message.sender==='me'?'message-me':'message-other'">-->
<!--                {{ message.content }}-->
<!--              </div>-->
<!--            </div>-->
<!--        </div>-->
<!--      </div>-->

<!--    </el-dialog>-->
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import TopNav from '@/components/TopNav'
import Hamburger from '@/components/Hamburger'
import Screenfull from '@/components/Screenfull'
import SizeSelect from '@/components/SizeSelect'
import Search from '@/components/HeaderSearch'
import RuoYiGit from '@/components/RuoYi/Git'
import RuoYiDoc from '@/components/RuoYi/Doc'

export default {
  components: {
    Breadcrumb,
    TopNav,
    Hamburger,
    Screenfull,
    SizeSelect,
    Search,
    RuoYiGit,
    RuoYiDoc
  },
  data() {
    return {
      // 是否显示弹出层
      open: false,
      // 弹出层标题
      title: "",
      baseUrl: process.env.VUE_APP_BASE_API,
      messages: [
        {sender: 'me', content: '你好！'},
        {sender: 'other', content: '你好啊！'},
        {sender: 'other', content: '请问有什么我可以帮助你的吗？'},
        {sender: 'me', content: '我正在寻找一家好的餐厅。'},
        {sender: 'other', content: '你在哪个城市？'},
        {sender: 'me', content: '我在北京。'},
        {sender: 'other', content: '好的，我可以为您推荐一些北京的餐厅。您需要什么类型的餐厅？'},
        {sender: 'me', content: '我想要吃火锅。'},
        {sender: 'other', content: '好的，以下是我为您推荐的北京火锅餐厅列表：[餐厅1，餐厅2，餐厅3]。您需要我帮您预约吗？'},
        {sender: 'me', content: '不需要，我会自己预约。谢谢您的帮助！'},
        {sender: 'other', content: '不客气，祝您用餐愉快！'},
        {sender: 'me', content: '再见！'},
        {sender: 'other', content: '再见！'}
      ],
    }
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'device'
    ]),
    setting: {
      get() {
        return this.$store.state.settings.showSettings
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'showSettings',
          value: val
        })
      }
    },
    topNav: {
      get() {
        return this.$store.state.settings.topNav
      }
    }
  },
  destroyed() {
    this.websock.close() //离开路由之后断开websocket连接
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      this.$confirm('确定注销并退出系统吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          location.href = '/index';
        })
      }).catch(() => {});
    }
  }
}
</script>

<style lang="scss" scoped>
.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0,21,41,.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background .3s;
    -webkit-tap-highlight-color:transparent;

    &:hover {
      background: rgba(0, 0, 0, .025)
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .topmenu-container {
    position: absolute;
    left: 50px;
  }

  .errLog-container {
    display: inline-block;
    vertical-align: top;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: rgba(0, 0, 0, .025)
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 40px;
          height: 40px;
          border-radius: 10px;
        }

        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}

.chatAppBody{
    display: flex;
    flex-direction: column;
    height: 70vh;
    background-color: #f1f5f8;
    overflow-y: scroll;
}
.chatTitle{
    background: #fff;
}
.chatBox{
    flex: 1;
    padding: 0 5px;
}
.chatBottom{
    background: #fff;
}
.chatRow{
    display: flex;
    align-items: flex-end;
    margin: 5px 0px;
}
.chatAvatar{
    margin-right: 5px;
    flex-shrink: 0;
}
.chatUsername {
    font-size: 12px;
    white-space: nowrap;
    color: #999;
    margin-bottom: 2px;
}
.chatContent{
    border-radius: 10px 10px 10px 0px;
    padding: 10px;
    background-color: rgb(255,255,255);
    box-shadow: 0 5px 30px rgb(50 50 93 / 8%), 0 1px 3px rgb(0 0 0 / 5%);
    font-size: 14px;
    word-break: break-all;
    line-height: 21px;
}
.chatRowMe{
    justify-content: flex-end;
}
.chatRowMe .chatContent{
    border-radius: 10px 10px 0px 10px;
}
.chat-message-other {
  /*background-color: red;*/
  display: flex;
  padding-left: 1rem;
  padding-top: 1rem;
}

.chat-message-me {
  /*background-color: red;*/
  display: flex;
  padding-right: 1rem;
  padding-top: 1rem;
  flex-direction: row-reverse; /* 将子div的顺序反转 */

}

.message-me-asWhole-headPortrait {
  padding: 3px;
}

.message-other-asWhole-headPortrait {
  padding: 3px;
}

.message-me-asWhole-right {
  display: flex;
  flex-direction: column; /* 设置子元素垂直排列 */
  margin-left: 0.1rem;
}

.message-other-asWhole-right {
  display: flex;
  flex-direction: column; /* 设置子元素垂直排列 */
  margin-left: 0.1rem;
}

.message-me-asWhole-top {
  padding: 3px;
  /* font-size: 12px; */
  font-family: 微软雅黑;
  padding: 3px;
  color: rgba(134, 144, 156, 1);
  text-align: right;
}

.message-other-asWhole-top {
  padding: 3px;
  /* font-size: 12px; */
  font-family: 微软雅黑;
  padding: 3px;
  color: rgba(134, 144, 156, 1);
}

.message-me {
  background-color: rgba(242, 243, 245, 1);
  max-width: 280px;
  word-wrap: break-word; /* 处理英文单词换行 */
  word-break: break-all; /* 处理中文换行 */
  display: inline-block; /*将div元素转换为行内块元素*/
  width: auto; /* 宽度根据文本宽度自动调正*/
  padding: 6px 12px;
  border-radius: 4px;
}

.message-other {
  background-color: rgba(242, 243, 245, 1);
  max-width: 280px;
  word-wrap: break-word; /* 处理英文单词换行 */
  word-break: break-all; /* 处理中文换行 */
  display: inline-block; /*将div元素转换为行内块元素*/
  width: auto; /* 宽度根据文本宽度自动调正*/
  padding: 6px 12px;
  border-radius: 4px;
}


.examineeFace_logo_style {
  width: 30px;
}

</style>
