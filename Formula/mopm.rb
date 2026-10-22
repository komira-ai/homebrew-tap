class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.23/mopm-0.0.23-macos-arm64.tar.gz"
      sha256 "0384bb028a7eab1103959e3746c7cb460c1e8cdf42b2393edb83a81e6bae3985"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.23/mopm-0.0.23-linux-aarch64.tar.gz"
      sha256 "b10016dffe822ce0083259f4e27207e5427bd1091f2fc3b37c17ef89380c754c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.23/mopm-0.0.23-linux-x86_64.tar.gz"
      sha256 "e4b9e197cc94ad439947cb24b30e00fc59458d9337119037985bf37a7568cbfc"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
