//1、请求获取用户通知权限
document.addEventListener('DOMContentLoaded', (event) => {
    if (Notification.permission === 'default') {
        Notification.requestPermission().then(permission => {
            if (permission === 'granted') {
                // 权限请求成功，发送通知
                sendNotification();
            }
        }).catch(error => {
            console.error('请求通知权限失败:', error);
        });
    } else if (Notification.permission === 'granted') {
        // 用户已授予权限，直接发送通知
        //sendNotification();
    }
});
//2、发送通知
/*function sendNotification() {
    const title = '通知标题';
    const options = {
        body: '这是通知的正文内容。',
        icon: 'https://example.com/icon.png', // 可选，通知的图标
        badge: 'https://example.com/badge.png' // 可选，通知的徽标
    };

    // 创建并显示通知
    new Notification(title, options);
}*/

//3、页面加载完成发送通知
window.onload = function() {
    if (Notification.permission === 'default') {
        Notification.requestPermission().then(permission => {
            if (permission === 'granted') {
                sendNotification();
            }
        }).catch(error => {
            console.error('请求通知权限失败:', error);
        });
    } else if (Notification.permission === 'granted') {
        const title = '亲爱的：'+userName;
        const options = {
            body: '嘿，欢迎踏入‘茶香四溢，乐购不停’的神奇茶界系统！在这里，每一片茶叶都藏着故事，每一次点击都能开启一场味蕾的探险。不只是购物，更是一场关于茶文化的趣味之旅。',
            icon: 'https://example.com/icon.png', // 可选，通知的图标
            badge: 'https://example.com/badge.png' // 可选，通知的徽标
        };
        // 创建并显示通知
        new Notification(title, options);
    }
};