class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.99/mopm-0.0.99-macos-arm64.tar.gz"
      sha256 "7aaa49357c304fc0f1d9a91f5b0657281ded5e03ccc279b396e19a38092f9f43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.99/mopm-0.0.99-linux-aarch64.tar.gz"
      sha256 "7dde8704d9f0d5850710aebaa146be51f1073e3931331af41b06c7cb18f420b0"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.99/mopm-0.0.99-linux-x86_64.tar.gz"
      sha256 "177a5e46ed9c1463aefc7b6a0cbe1e01aea7c11e7ee79bc8fb04b3382c8ed9d4"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
