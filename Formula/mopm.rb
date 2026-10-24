class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.46/mopm-0.0.46-macos-arm64.tar.gz"
      sha256 "2bbf984c1b37a819f6afb3dba147456fbdafead40a9974625230a53b36a63ba1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.46/mopm-0.0.46-linux-aarch64.tar.gz"
      sha256 "45994e71b101a85e3fdc29d717920b9cb75a992e5f8d66c39a66da7ed4a9f329"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.46/mopm-0.0.46-linux-x86_64.tar.gz"
      sha256 "b28de119698f4f3d4950db37907a8eb5fae49f000f8656c9394f1f62aac2c735"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
