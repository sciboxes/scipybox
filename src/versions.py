import importlib

module_names = (
    'IPython', 'jinja2', 'matplotlib', 'numpy', 'scipy', 'tornado', 'zmq'
)

for module_name in module_names:
    try:
        module = importlib.import_module(module_name)
    except ImportError:
        print 'Module {} is not installed!'.format(module_name)
    else:
        try:
            module_version = module.__version__
        except AttributeError:
            module_version = module.version
        finally:
            print '{}: {}'.format(module_name, module_version)
