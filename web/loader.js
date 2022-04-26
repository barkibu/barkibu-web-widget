(function (window, document) {
  function WidgetProxy(widgetHost, assetsMap) {
    this.widgetHost = widgetHost;
    this.assetsMap = assetsMap;
    this.initialized = false;
  }

  WidgetProxy.prototype.send = function (name, options) {
    if (this[name] && this[name].call) {
      this[name].call(this, options);
    } else {
      console.error('Unknown method: ' + name);
    }
  }

  WidgetProxy.prototype.widgetMessagesHandler = function (message) {
    if (this.eventHandler) {
      setTimeout(function () {
        this.eventHandler(message.data.event, message.data.payload)
      }, 0);
    }
    switch (message.data.event) {
      case 'widget_closed':
        this.close();
        break;
    }
  }

  WidgetProxy.prototype.init = function (config) {
    if (this.initialized) return;

    if (config && config['client_id']) {
      this.config = config;
      if (!this.config['theme']) { this.config['theme'] = 'default' };
      this.iframeContainer = this.buildIframeContainer();
      this.iframeElement = this.buildIframe();
      this.buttonContainer = this.buildButtonContainer();
      this.rootContainer = this.buildRootContainer();
      this.stylesheets = this.buildStylesheet();
      this.eventHandler = config['eventHandler'];
      window.addEventListener('message', this.widgetMessagesHandler.bind(this));
      this.rootContainer.append(this.iframeContainer);
      this.rootContainer.append(this.buttonContainer);
      document.body.appendChild(this.rootContainer);
      document.head.appendChild(this.stylesheets);
      this.close();
      this.initialized = true;
    } else {
      console.error('Please provide init configuration');
    }
  };

  WidgetProxy.prototype.buildIframe = function () {
    var iframe = document.createElement('iframe');
    iframe.src = this.iframeUrl();
    iframe.allow = 'camera *;microphone *';
    return iframe;
  }

  WidgetProxy.prototype.buildStylesheet = function () {
    var link = document.createElement('link');
    link.setAttribute('rel', 'stylesheet');
    link.setAttribute('type', 'text/css');
    link.setAttribute('href', '//' + this.widgetHost + '/loader.css' + '?v=' + this.assetsMap['loader.css']);
    return link;
  }

  WidgetProxy.prototype.buildIframeContainer = function () {
    var container = document.createElement('div');
    container.id = '_vet-chat-widget-container'
    // Container is hidden until css is loaded
    container.style = 'display:none';
    return container;
  }

  WidgetProxy.prototype.buildRootContainer = function () {
    var container = document.createElement('div');
    container.dataset.theme = this.config['theme'];
    container.id = '_vet-chat-root-container';
    return container;
  }

  WidgetProxy.prototype.buildButtonContainer = function () {
    var container = document.createElement('div');
    var button = document.createElement('button');
    button.addEventListener('click', this.toggleWidget.bind(this))
    container.appendChild(button);
    container.id = '_vet-chat-widget-toggle-container'
    // Container is hidden until css is loaded
    button.type = 'button';
    button.innerHTML = '<img id="_vet-chat-open"' +
      'src="//' + this.widgetHost + '/assets/images/widget-icon-' + this.config['theme'] + '.svg' + '"/>' +
      '<img id="_vet-chat-close"' +
      'src="//' + this.widgetHost + '/assets/images/close-icon-' + this.config['theme'] + '.svg' + '"/>';
    container.style = 'display:none';
    return container;
  }

  WidgetProxy.prototype.iframeUrl = function () {
    var query = 'client_id=' + this.config['client_id'] + '&v=' + this.assetsMap['main.js'];
    if (this.config['locale']) {
      query += ('&locale=' + this.config['locale']);
    }
    if (this.config['country']) {
      query += ('&country=' + this.config['country']);
    }
    if (this.config['theme']) {
      query += ('&theme=' + this.config['theme']);
    }
    if (this.config['auth_token']) {
      query += ('&auth_token=' + this.config['auth_token'])
    }
    if (this.config['otp_token']) {
      query += ('&otp_token=' + this.config['otp_token'])
    }
    if (this.config['path']) {
      query += ('#/' + this.config['path'])
    }
    return '//' + this.widgetHost + '/index.html?' + query;
  };

  WidgetProxy.prototype.close = function () {
    this.isWidgetOpened = false;
    this.iframeContainer.classList.remove('_opened');
    this.buttonContainer.classList.remove('_opened');
    this.iframeContainer.classList.add('_closed');
    this.buttonContainer.classList.add('_closed');
  };

  WidgetProxy.prototype.open = function () {
    this.isWidgetOpened = true;
    if (!this.isWidgetLoaded) { this.loadWidget(); }
    this.iframeContainer.classList.remove('_closed');
    this.buttonContainer.classList.remove('_closed');
    this.iframeContainer.classList.add('_opened');
    this.buttonContainer.classList.add('_opened');
  };

  WidgetProxy.prototype.toggleWidget = function () {
    this.isWidgetOpened ? this.close() : this.open();
  }

  WidgetProxy.prototype.loadWidget = function () {
    this.iframeContainer.appendChild(this.iframeElement);
    this.isWidgetLoaded = true;
  }

  WidgetProxy.prototype.applyQueuedCalls = function (queue) {
    if (!queue) return;

    for (var i = 0; i < queue.length; i++) {
      this.send.apply(this, Array.prototype.slice.call(queue[i]));
    }
  };

  var globalName = window['vetChatWidgetName'];
  var widgetProxy = new WidgetProxy(window[globalName].hostName, window[globalName].assets);
  widgetProxy.applyQueuedCalls(window[globalName].q);
  window[globalName] = widgetProxy;
})(window, document);
