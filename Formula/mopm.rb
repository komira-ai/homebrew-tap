class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.144/mopm-0.0.144-macos-arm64.tar.gz"
      sha256 "c4758ea9ea5d7effae9247e1599f02f413c922072fd491b87a1ecd0930d321bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.144/mopm-0.0.144-linux-aarch64.tar.gz"
      sha256 "fc32851d3a0ccbd71c1612adb8db87f753de4862868e596862e474290dc4faf7"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.144/mopm-0.0.144-linux-x86_64.tar.gz"
      sha256 "2c7b87e7e5b62420d76d8156ee4fda96bdcc3e05bccf12262e3a77775c136c54"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
