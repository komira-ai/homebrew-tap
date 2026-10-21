class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.13/mopm-0.0.13-macos-arm64.tar.gz"
      sha256 "228aa321e14522d5fdcfb7526ccfd27682a9a7ad83a63d3adae98eec71904145"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.13/mopm-0.0.13-linux-aarch64.tar.gz"
      sha256 "6a3372d87b40d69017082cbfbe7cf80f8e241dbb86a04d0ea3224a64b6c8aaaf"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.13/mopm-0.0.13-linux-x86_64.tar.gz"
      sha256 "59cb906dcb1899f2c3445d531a29fab7ea00c726356c534aa2be6c59ae26ec85"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
