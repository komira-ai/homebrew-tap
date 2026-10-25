class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.54/mopm-0.0.54-macos-arm64.tar.gz"
      sha256 "0f76215e6bc36645d89228746ce87a0a56ed7c46473893e01addb23e4e3b52fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.54/mopm-0.0.54-linux-aarch64.tar.gz"
      sha256 "c7bfb6736d2c20632814f88fa8e6d6e7c32a72c226caf4469aa0b3747baf4255"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.54/mopm-0.0.54-linux-x86_64.tar.gz"
      sha256 "a9b91449643239b667ef6d5b48066d8e7bda1796304960754472b119349f7cfd"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
