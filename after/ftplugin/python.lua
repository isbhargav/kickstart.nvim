-- setup projectionist
vim.g.projectionist_heuristics = {
  ['src/|tests/'] = {
    -- for a src file (e.g. src/foo/bar.py), go to tests/foo/bar_test.py
    ['src/*.py'] = { alternate = 'tests/test_{}.py', type = 'source' },
    -- -- for a test file (e.g. tests/foo/bar_test.py), go to src/foo/bar.py
    ['tests/test_*.py'] = { alternate = 'src/{}.py', type = 'test' },
  },
}
