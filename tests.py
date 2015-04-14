import salt.client


def test_salt_states():
    caller = salt.client.Caller()
    output = caller.sminion.functions['state.highstate']()
    for k, v in output.items():
        assert v['result'], (k, v)


def test_locale_state():
    caller = salt.client.Caller()
    output = caller.sminion.functions['state.sls']('locale')
    for k, v in output.items():
        assert v['result'], (k, v)


def test_python_states():
    caller = salt.client.Caller()
    output = caller.sminion.functions['state.sls']('python')
    for k, v in output.items():
        assert v['result'], (k, v)


def test_virtualenv_states():
    caller = salt.client.Caller()
    output = caller.sminion.functions['state.sls']('virtualenv')
    for k, v in output.items():
        assert v['result'], (k, v)
